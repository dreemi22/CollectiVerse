const HDWalletProvider = require("@truffle/hdwallet-provider");
require("dotenv").config(); // Load .env file
module.exports = {
  networks: {
    matic: {
      provider: () =>
        new HDWalletProvider(
          process.env.MNEMONIC,
          `https://polygon-mumbai.g.alchemy.com/v2/Mv3es8eKlXQEmn4u8lqQBqdKhBXc7ktr`
        ),
      network_id: 80001,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true,
      gas: 6000000,
      gasPrice: 10000000000,
    },
    development: {
      host: "0.0.0.0",
      port: 7545,
      network_id: "5777",
    },
    advanced: {
      websockets: true,
    },
  },
  contracts_build_directory: "./src/abis/",
  compilers: {
    solc: {
      version: "0.8.19",
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
};
// 94625bbc3e3094cdabf7ca794169a8b949d2e2366aa5162e6f3795197b059f2a