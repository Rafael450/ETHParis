pragma solidity ^0.8.0;

import "openzeppelin-contracts/token/ERC721/ERC721.sol";
import "reference/src/ERC6551Registry.sol";

contract MyNFT is ERC721 {
    IERC6551Registry public erc6551Registry;
    uint256 public chainId;
    
    constructor(
        address _erc6551Registry, 
        uint256 _chainId) 
    ERC721("MyNFT", "MNFT") {
        erc6551Registry = IERC6551Registry(_erc6551Registry);
        chainId = _chainId;
    }
    
    function mint(
        address to, 
        uint256 tokenId,
        address[] memory accounts,
        bytes memory initData)
    public {
        _mint(to, tokenId);
        
        erc6551Registry.createAccount(
            address(erc6551Registry),
            chainId,
            address(this),
            tokenId,
            uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, msg.sender))),
            initData
        );
    }
}