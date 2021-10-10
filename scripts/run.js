const main = async () => {
    const nftContractFactory = await hre.ethers.getContractFactory('ScorpyNFT');
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log('Contract Deployed to:', nftContract.address);

    let txn = await nftContract.makeNFT();
    await txn.wait();
};

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (e) {
        console.log(e);
        process.exit(1);
    }
};

runMain();