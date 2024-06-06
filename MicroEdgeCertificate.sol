// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MicroEdgeCertificate is ERC721URIStorage, Ownable {
    uint256 public nextTokenId;
    address public admin;

    constructor() ERC721("MicroEdgeCertificate", "MEC") Ownable(msg.sender) {
        admin = msg.sender;
    }

    function mint(address to, string memory ipfsHash) external onlyOwner {
        _safeMint(to, nextTokenId);
        _setTokenURI(nextTokenId, string(abi.encodePacked("ipfs://", ipfsHash)));
        nextTokenId++;
    }

    function revoke(uint256 tokenId) external onlyOwner {
        _burn(tokenId);
    }

    function changeAdmin(address newAdmin) external onlyOwner {
        admin = newAdmin;
    }
}
