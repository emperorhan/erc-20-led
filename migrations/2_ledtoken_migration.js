const LedToken = artifacts.require("LedToken");

module.exports = function (deployer) {
    deployer.deploy(LedToken);
};
