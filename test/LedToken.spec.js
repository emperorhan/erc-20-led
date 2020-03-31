const LedToken = artifacts.require("LedToken");

contract("LedToken", (deployer) => {
    it("should put 100e10 LedToken in the first account", async () => {
        const instance = await LedToken.deployed();
        const totalSup = instance.totalSupply();
        console.log(totalSup);
    });
});
