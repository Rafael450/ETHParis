import { ethers } from "hardhat";

async function main() {
    const currentTimestampInSeconds = Math.round(Date.now() / 1000);
    const ONE_YEAR_IN_SECS = 365 * 24 * 60 * 60;
    const unlockTime = currentTimestampInSeconds + ONE_YEAR_IN_SECS;
  
    const lockedAmount = ethers.parseEther("1");
  
    const ChainFund6551 = await ethers.getContractFactory("ChainFund6551");
    const chainFund6551 = await ChainFund6551.deploy();
    
    await chainFund6551.waitForDeployment();
    console.log("ERC6551 address:", chainFund6551.target);

    const ERC6551Registry = await ethers.getContractFactory("ERC6551Registry");
    const eRC6551Registry = await ERC6551Registry.deploy();
    
    await eRC6551Registry.waitForDeployment();
    console.log("Regestry address:", eRC6551Registry.target);
  
    const ChainFund721 = await ethers.getContractFactory("ChainFund");
    const chainFund721 = await ChainFund721.deploy(
        eRC6551Registry.target, 
        chainFund6551.target, 
        "0xE592427A0AEce92De3Edee1F18E0157C05861564");
  
    await chainFund721.waitForDeployment();
    console.log("ERC721 address:", chainFund721.target);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
