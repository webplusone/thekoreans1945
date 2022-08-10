// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./standards/IERC721G.sol";

contract TheKoreans1945Minter is Ownable {
    event SetNFTs(address nft, bool status);
    event Mint(address user, uint256 tokenId, address nft, uint256 mintedAmount);
    event Airdrop(address[] users, uint256 initialId, uint256 lastId);

    IERC721G public immutable KOREANS;
    mapping(address => bool) public isListedNFT;
    mapping(address => mapping(address => uint256)) public mintedAmount;

    constructor(IERC721G _KOREANS, address[] memory nfts) {
        KOREANS = _KOREANS;

        uint256 amount = nfts.length;
        for (uint256 i = 0; i < amount; i++) {
            isListedNFT[nfts[i]] = true;
            emit SetNFTs(nfts[i], true);
        }
    }

    function setNFTs(address[] calldata nfts, bool status) external onlyOwner {
        for (uint256 i = 0; i < nfts.length; i++) {
            isListedNFT[nfts[i]] = status;
            emit SetNFTs(nfts[i], status);
        }
    }

    function airdrop(address[] calldata users) external onlyOwner {
        uint256 startId = KOREANS.totalSupply();
        for (uint256 i = 0; i < users.length; i++) {
            KOREANS.mint(users[i], startId + i);
        }
        emit Airdrop(users, startId, startId + users.length - 1);
    }

    function mint(address nft) external {
        require(isListedNFT[nft], "INVALID_NFT_ADDRESS");
        uint256 balance = IERC721(nft).balanceOf(msg.sender);
        uint256 _mintedAmount = mintedAmount[msg.sender][nft];
        require(_mintedAmount < balance, "OUT_OF_RANGE");

        uint256 tokenId = KOREANS.totalSupply();
        KOREANS.mint(msg.sender, tokenId);
        mintedAmount[msg.sender][nft] = _mintedAmount + 1;

        emit Mint(msg.sender, tokenId, nft, _mintedAmount + 1);
    }
}
