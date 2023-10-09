var nft = artifacts.require("NFTs");

module.exports = function (deployer) {
    deployer.deploy(nft);
};