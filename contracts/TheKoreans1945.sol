// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "./standards/ERC721G.sol";

contract TheKoreans1945 is ERC721G {
    constructor() ERC721G("The Koreans", "KOREANS", "https://thekoreans.webplusone.com/metadata/") {}
}
