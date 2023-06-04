// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyToken is ERC721 {
    address private _owner;

    constructor() ERC721("Martu First Art - Mike", "MFAM1") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://gateway.pinata.cloud/ipfs/QmVqjmDVpFyysfzkszfYNGQGArn6bcPLvevHwHNXsztxuN/";
    }

    function safeMint(address to) public {
        // El primero que lo mintea se lo queda!!!
        require(_owner == address(0));
        _owner = msg.sender;
        _safeMint(to, 0);
    }
}
