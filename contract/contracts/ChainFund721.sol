// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "openzeppelin-contracts/token/ERC721/ERC721.sol";
import "openzeppelin-contracts/token/ERC20/IERC20.sol";
import "openzeppelin-contracts/security/ReentrancyGuard.sol";
import "reference/src/ERC6551Registry.sol";
import "reference/src/interfaces/IERC6551Account.sol";
import "v3-periphery/interfaces/ISwapRouter.sol";

error FundDoesNotExist();
error FundDoesNotAcceptThisERC20();

contract ChainFund is 
    ERC721, 
    ReentrancyGuard
{
    IERC6551Registry public erc6551Registry;
    ISwapRouter public swapRouter;
    address public implementation;
    uint256 public chainId = block.chainid;
    uint256 public tokens = 0;

    uint24 public constant poolFee = 3000;

    // NFT ID => depositor => amount
    mapping(uint256 => mapping(address => uint256)) public deposits;

    mapping(uint256 => uint256) public totalDeposits;


    // NFT ID => ERC20 index => ERC20 token address
    mapping(uint256 => mapping(uint => address)) public fundTokens;

    mapping(address => bool) public verifiedUsers;

    event NewFund(
        address indexed to,
        uint256 indexed tokenId
    );

    event Deposit(
        address indexed from,
        uint256 indexed tokenId,
        uint256 amount
    );
    
    
    constructor(
        address _erc6551Registry,
        address _implementation,
        address _swapRouter
    ) ERC721("MyNFT", "MNFT") {
        erc6551Registry = IERC6551Registry(_erc6551Registry);
        implementation = _implementation;
        swapRouter = ISwapRouter(_swapRouter);
    }
    
    function mint(
        address to,
        address[] memory funds
    ) public {
        _safeMint(to, tokens);

        // Each new NFT gets its own account
        erc6551Registry.createAccount(
            implementation,
            chainId,
            address(this),
            tokens,
            0,
            bytes("")
        );

        for(uint i = 0; i < funds.length; i++) {
            fundTokens[tokens][i] = funds[i];
        }

        emit NewFund(to, tokens);

        tokens++;
    }

    function getAccount(uint tokenId) public view returns (address) {
        return
            erc6551Registry.account(
                implementation,
                chainId,
                address(this),
                tokenId,
                0
            );
    }

    function deposit(
        uint256 tokenId
    ) public payable nonReentrant {
        address account = getAccount(tokenId);
        (bool success, ) = account.call{value: msg.value}("");
        totalDeposits[tokenId] += msg.value;
        deposits[tokenId][msg.sender] += msg.value;
        require(success, "Failed to send MATIC");

        emit Deposit(msg.sender, tokenId, msg.value);
    }

    function approveToken(uint256 tokenId, address token, address spender, uint256 amount) internal {
        require(msg.sender == ownerOf(tokenId), "Not token owner");
        bytes memory data = abi.encodeWithSignature("approve(address,uint256)", spender, amount);
        
        // get the address of the ERC6551 account
        address account = getAccount(tokenId);
        IERC6551Account erc6551Account = IERC6551Account(payable(account));

        // call the approve function on the ERC20 token from the ERC6551 account
        bytes memory result = erc6551Account.executeCall(address(token), 0, data);

        // optionally you can check the result to ensure the approve call was successful
        (bool success,) = abi.decode(result, (bool, bytes));
        require(success, "Approval failed");
    }

    function swapExactInputSingle(
        uint256 tokenId,
        uint256 amountIn,
        address tokenIn,
        address tokenOut
    ) external returns (uint256 amountOut) {
        approveToken(tokenId, tokenIn, address(swapRouter), amountIn);

        ISwapRouter.ExactInputSingleParams memory params = ISwapRouter
            .ExactInputSingleParams({
                tokenIn: tokenIn,
                tokenOut: tokenOut,
                fee: poolFee,
                recipient: msg.sender,
                deadline: block.timestamp,
                amountIn: amountIn,
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            });

        amountOut = swapRouter.exactInputSingle(params);
    }

    function swapExactOutputSingle(
        uint256 amountOut,
        uint256 amountInMaximum,
        address tokenIn,
        address tokenOut
    ) external returns (uint256 amountIn) {
        require(ownerOf(tokens) == msg.sender, "Not token owner");
        require(isTokenAllowed(tokens, tokenIn), "srcToken not allowed");
        require(isTokenAllowed(tokens, tokenOut), "dstToken not allowed");

        IERC20(tokenIn).approve(address(swapRouter), amountInMaximum);

        ISwapRouter.ExactOutputSingleParams memory params = ISwapRouter
            .ExactOutputSingleParams({
                tokenIn: tokenIn,
                tokenOut: tokenOut,
                fee: poolFee,
                recipient: msg.sender,
                deadline: block.timestamp,
                amountOut: amountOut,
                amountInMaximum: amountInMaximum,
                sqrtPriceLimitX96: 0
            });

        amountIn = swapRouter.exactOutputSingle(params);

        if (amountIn < amountInMaximum) {
            IERC20(tokenIn).approve(address(swapRouter), 0);
            IERC20(tokenIn).transfer(msg.sender, amountInMaximum - amountIn);
        }
    }


    function isTokenAllowed(uint256 tokenId, address token) private view returns(bool) {
        uint i = 0;
        while (fundTokens[tokenId][i] != address(0)) {
            if (fundTokens[tokenId][i] == token) return true;
            i++;
        }
        return false;
    }
}