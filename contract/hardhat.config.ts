import * as dotenv from "dotenv";
import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@nomicfoundation/hardhat-foundry";

dotenv.config({ path: __dirname+'/.env' });
const myPrivateKey: string = process.env.PRIVATE_KEY as string;
const myInfuraId: string = process.env.DEPLOY_INFURA_KEY as string;
const myQuicknodeId: string = process.env.DEPLOY_QUICKNODE_KEY as string;


const config: HardhatUserConfig = {
  solidity:  {
    version: "0.8.17",
    settings: {
      optimizer: {
        enabled: true,
        runs: 1000,
      },
    },
  },
  networks: {
    gnosis: {
      url: `https://clean-practical-log.xdai.discover.quiknode.pro/${myQuicknodeId}`,
      accounts: [myPrivateKey],
    }
  },
  paths: {
    artifacts: "./build"
  }
};

export default config;