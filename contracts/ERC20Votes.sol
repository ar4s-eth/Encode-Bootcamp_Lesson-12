const TOKENS_MINTED = etheres.utils.parseEtheres("1");

async function main() {
    const [deployer, acc1, acc2] = await ethers.getSigners();
    const myTokenContractFactory = await ethers.getContractFactory("MyToken");
    const myTokenContract = await myTokenContractFactory.deploy();
}

 main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});