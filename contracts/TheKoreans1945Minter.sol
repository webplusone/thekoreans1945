// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./standards/IERC721G.sol";

contract TheKoreans1945Minter is Ownable {
    event SetNFTWhitelist(address nft, bool status);
    event SetUserWhitelist(address user, bool status);
    event Mint(address user, uint256 tokenId);
    event Airdrop(address[] users, uint256 initialId, uint256 lastId);

    IERC721G public immutable KOREANS;
    mapping(address => bool) public isListedNFT;
    mapping(address => bool) public isListedUser;
    mapping(address => mapping(address => uint256)) public mintedAmount;

    constructor(IERC721G _KOREANS, address[] memory nfts) {
        KOREANS = _KOREANS;

        uint256 amount = nfts.length;
        for (uint256 i = 0; i < amount; i++) {
            isListedNFT[nfts[i]] = true;
            emit SetNFTWhitelist(nfts[i], true);
        }
    }

    function setNFTWhitelist(address[] calldata nfts, bool status) external onlyOwner {
        for (uint256 i = 0; i < nfts.length; i++) {
            isListedNFT[nfts[i]] = status;
            emit SetNFTWhitelist(nfts[i], status);
        }
    }

    function setUserWhitelist(address[] calldata users, bool status) external onlyOwner {
        for (uint256 i = 0; i < users.length; i++) {
            isListedUser[users[i]] = status;
            emit SetUserWhitelist(users[i], status);
        }
    }

    function airdrop(address[] calldata users) external onlyOwner {
        uint256 startId = KOREANS.totalSupply();
        for (uint256 i = 0; i < users.length; i++) {
            KOREANS.mint(users[i], startId + i);
            emit Mint(users[i], startId + i);
        }
        emit Airdrop(users, startId, startId + users.length - 1);
    }

    function mintByNFTWhitelist(address nft) external {
        require(isListedNFT[nft], "INVALID_NFT_ADDRESS");
        require(mintedAmount[msg.sender][nft]++ < IERC721(nft).balanceOf(msg.sender), "OUT_OF_RANGE");
        _mint();
    }

    function mintByUserWhitelist() external {
        require(isListedUser[msg.sender], "UNAUTHORIZED");
        delete isListedUser[msg.sender];
        _mint();
    }

    function _mint() internal {
        uint256 tokenId = KOREANS.totalSupply();
        KOREANS.mint(msg.sender, tokenId);
        emit Mint(msg.sender, tokenId);
    }
}
