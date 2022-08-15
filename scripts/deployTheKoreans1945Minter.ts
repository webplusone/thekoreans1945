import hardhat from "hardhat";

async function main() {
    console.log("deploy start")

    const TheKoreans1945Minter = await hardhat.ethers.getContractFactory("TheKoreans1945Minter")
    const theKoreans1945Minter = await TheKoreans1945Minter.deploy(
        "0xA7298E98362625b65d08bB4C25992C503A0d48db",
        [
            "0x9f69C2a06c97fCAAc1E586b30Ea681c43975F052", // 소울링크
            "0xb48E526d935BEe3891222f6aC10A253e31CCaBE1", // 가이아 제네시스
            "0xe7df0DcA32eb23F4182055dC6a2053A3fF239315", // 가이아 슈퍼노바
            "0xFfFd676Bffd8797f34C2Adc3E808F374CAEe49D8", // 가이아 스테이블다오

            "0xff80bd43e3f0e414afc70cb8ac1d3f0e6a303a2f", // 실타래1
            "0xa501af9131dd41c4f9913f48012b09e7d00f28ef", // 실타래2

            // 크립토펑크
            "0xb47e3cd837dDF8e4c57F05d70Ab865de6e193BBB",

            // 샤크펑크
            "0xa59a5b0c946086d6884455a6a556729d747d16d3",

            // 고스트 프로젝트
            "0xdf3407636bbf3a015a8e48a079ef7ba49e687fd3",

            // 허스크
            "0x78b5c749780dc665fcf2c039ca13cb30110a4821",

            // 버그시티
            "0x0084837cc386150E56C0E93F2E59469579dA5443",
            "0xBb0C07dA78176a3691149b9227E7EBAFbD741De7",
        ],
        [
            "0x9f69C2a06c97fCAAc1E586b30Ea681c43975F052", // 소울링크
            "0xb48E526d935BEe3891222f6aC10A253e31CCaBE1", // 가이아 제네시스
            "0xe7df0DcA32eb23F4182055dC6a2053A3fF239315", // 가이아 슈퍼노바
            "0xFfFd676Bffd8797f34C2Adc3E808F374CAEe49D8", // 가이아 스테이블다오
        ],
    )
    console.log(`TheKoreans1945Minter address: ${theKoreans1945Minter.address}`)
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });