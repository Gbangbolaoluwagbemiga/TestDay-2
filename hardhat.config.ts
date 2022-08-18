import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import { any } from "hardhat/internal/core/params/argumentTypes";

require("dotenv").config();

type HttpNetworkAccountUserConfig = any;
const config: HardhatUserConfig = {
  solidity: "0.8.9",
  networks: {
    // hardhat: {
    //   forking: {
    //     url: "https://mainnet.infura.io/v3/044d6b87f4a849aab23a0f0b3352d79c",
    //   },
    // },
    goerli:{
      url: process.env.GOERLI_URL,
      accounts:[process.env.PRIVATE_KEY] as HttpNetworkAccountUserConfig | undefined,
    },
    ropsten: {
      url: process.env.ROPSTEN_URL,
      // @ts-ignore
      accounts: [process.env.PRIVATE_KEY] as
        | HttpNetworkAccountUserConfig
        | undefined,
    },
  },
};

export default config;
