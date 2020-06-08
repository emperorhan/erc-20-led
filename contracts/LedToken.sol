// pragma solidity 0.5.16;
pragma solidity ^0.5.0;

import "./CustomToken.sol";


contract LedToken is CustomToken {
    uint8 private DECIMALS = 4; // 소수점 자리수
    uint256 private MAX_TOKEN_COUNT = 1000000000; // 총 토큰 개수
    uint256 private MAX_SUPPLY = MAX_TOKEN_COUNT * (10**uint256(DECIMALS)); // 총 발행량
    uint256 private INITIAL_SUPPLY = (MAX_SUPPLY * 1) / 1; // 초기 공급량
    string private TOKEN_NAME = "Ledgis"; // 토큰 이름
    string private TOKEN_SYMBOL = "LED"; // 토큰 심볼

    bool private issued = false;

    constructor() public CustomToken(TOKEN_NAME, TOKEN_SYMBOL, DECIMALS, MAX_SUPPLY) {
        require(issued == false, "token already minted");
        super.mint(msg.sender, INITIAL_SUPPLY);
        issued = true;
    }
}
