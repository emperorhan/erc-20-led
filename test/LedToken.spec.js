const {accounts} = require("@openzeppelin/test-environment");

const {
    BN, // Big Number support
    constants, // Common constants, like the zero address and largest integers
    expectEvent, // Assertions for emitted events
    expectRevert, // Assertions for transactions that should fail
} = require("@openzeppelin/test-helpers");

const LedToken = artifacts.require("LedToken");

contract("LedToken", function ([sender, receiver]) {
    beforeEach(async function () {
        this.led = await LedToken.new();
        this.amount = new BN(100000);
    });
    it("has a name", async function () {
        expect(await this.led.name()).equal("Ledgis");
    });
    it("has a symbol", async function () {
        expect(await this.led.symbol()).equal("LED");
    });
    it("has 4 decimals", async function () {
        expect((await this.led.decimals()).toString()).equal("4");
    });
    it("has " + String(10000000000000) + " total supply", async function () {
        expect((await this.led.totalSupply()).toString()).equal("10000000000000");
    });
    it("assigns the initial total supply to the creator", async function () {
        const totalSupply = await this.led.totalSupply();
        const ownerBalance = await this.led.balanceOf(sender);
        expect(ownerBalance.toString()).equal(totalSupply.toString());
    });
    it("transfer token to the receiver", async function () {
        await this.led.transfer(receiver, this.amount, {from: sender});
        const receiverBalance = await this.led.balanceOf(receiver);
        expect(receiverBalance.toString()).equal(this.amount.toString());
    });
    it("reverts when transferring tokens to the zero address", async function () {
        let ownerBalance = await this.led.balanceOf(sender);
        console.log(ownerBalance.toString());
        // Conditions that trigger a require statement can be precisely tested
        await expectRevert(
            this.led.transfer(constants.ZERO_ADDRESS, this.amount, {from: sender}),
            "ERC20: transfer to the zero address"
        );
        ownerBalance = await this.led.balanceOf(sender);
        console.log(ownerBalance.toString());
    });
    it("emits a Transfer event on successful transfers", async function () {
        const receipt = await this.led.transfer(receiver, this.amount, {from: sender});

        // Event assertions can verify that the arguments are the expected ones
        expectEvent(receipt, "Transfer", {
            from: sender,
            to: receiver,
            value: this.amount,
        });
    });
});
// "solc": "./node_modules/.bin/solc flat/LedToken_flat.sol --abi --bin",
