const TOKENS_MINTED = etheres.utils.parseEtheres("1");

async function main() {
    const [deployer, acc1, acc2] = await ethers.getSigners();
    const myTokenContractFactory = await ethers.getContractFactory("MyToken");
    const myTokenContract = await myTokenContractFactory.deploy();
}
    const currentBlock = await ethers.provider.getBlock("latest");
    console.log(`The current block is: ${currentBlock.number}`);
    
    const currentBlock2 = await ethers.provider.getBlock("latest");
    console.log(`The current block is: ${currentBlock.number}`);
    const pastVotes = await Promise.all([
        myTokenContract.getPastVotes(acc1.address, 3),
        myTokenContract.getPastVotes(acc1.address, 2),
        myTokenContract.getPastVotes(acc1.address, 1),
        myTokenContract.getPastVotes(acc1.address, 0),
    ])
    
 main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});