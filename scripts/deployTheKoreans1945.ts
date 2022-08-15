import hardhat from "hardhat";

async function main() {
    console.log("deploy start")

    const TheKoreans1945 = await hardhat.ethers.getContractFactory("TheKoreans1945")
    const theKoreans1945 = await TheKoreans1945.deploy()
    console.log(`TheKoreans1945 address: ${theKoreans1945.address}`)
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });