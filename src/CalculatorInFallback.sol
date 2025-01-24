// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract CalculatorInFallback {
    uint256 public result;

    fallback() external {
        // your code here
        // compare the function selector in the calldata with the any of the selectors below, then
        // execute a logic based on the right function selector and store the result in `result` variable.
        // assumming operations won't overflow

        // add(uint256,uint256) -> 0x771602f7 (add two numbers and store result in storage)
        // sub(uint256,uint256) -> 0xb67d77c5 (sub two numbers and store result in storage)
        // mul(uint256,uint256) -> 0xc8a4ac9c (mul two numbers and store result in storage)
        // div(uint256,uint256) -> 0xa391c15b (div two numbers and store result in storage)
        assembly {
            let selector := shr(224, calldataload(0x00))
            let x := calldataload(0x04)
            let y := calldataload(0x24)

            switch selector
            case 0x771602f7 { sstore(0, add(x, y)) }
            case 0xb67d77c5 { sstore(0, sub(x, y)) }
            case 0xc8a4ac9c { sstore(0, mul(x, y)) }
            case 0xa391c15b { sstore(0, div(x, y)) }
        }
    }
}
