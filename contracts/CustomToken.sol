pragma solidity ^0.5.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20Capped.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";
import "../node_modules/@openzeppelin/contracts/ownership/Ownable.sol";


contract CustomToken is ERC20, ERC20Detailed, ERC20Capped, ERC20Burnable, Ownable {
    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 maxSupply
    ) public ERC20Burnable() ERC20Capped(maxSupply) ERC20Detailed(name, symbol, decimals) ERC20() {}

    function mint(address to, uint256 value) public onlyOwner returns (bool) {
        _mint(to, value);
        return true;
    }
}
