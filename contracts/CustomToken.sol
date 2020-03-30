pragma solidity >=0.5.4;

import "@openzeppelin/token/ERC20/ERC20.sol";
import "@openzeppelin/token/ERC20/ERC20Detailed.sol";
import "@openzeppelin/token/ERC20/ERC20Capped.sol";
import "@openzeppelin/token/ERC20/ERC20Burnable.sol";


contract CustomToken is ERC20, ERC20Detailed, ERC20Capped, ERC20Burnable {
    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _maxSupply
    )
        public
        ERC20Burnable()
        ERC20Capped(_maxSupply)
        ERC20Detailed(_name, _symbol, _decimals)
        ERC20()
    {
        _mint(msg.sender, initialSupply);
    }
}
