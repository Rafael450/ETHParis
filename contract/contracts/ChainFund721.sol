// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "openzeppelin-contracts/token/ERC721/ERC721.sol";
import "reference/src/ERC6551Registry.sol";

contract ChainFund is ERC721 {
    IERC6551Registry public erc6551Registry;
    address public implementation;
    uint256 public chainId = block.chainid;
    
    constructor(
        address _erc6551Registry,
        address _implementation,
        uint256 _chainId)
    ERC721("MyNFT", "MNFT") {
        erc6551Registry = IERC6551Registry(_erc6551Registry);
        implementation = _implementation;
    }
    
    function mint(address to, uint256 tokenId, bytes memory initData) public {
        _mint(to, tokenId);
        
        // Each new NFT gets its own account
        erc6551Registry.createAccount(
            implementation,
            chainId,
            address(this),
            tokenId,
            uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))),
            initData
        );
    }
}