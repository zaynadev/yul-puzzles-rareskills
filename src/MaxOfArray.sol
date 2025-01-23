// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract MaxOfArray {
    function main(uint256[] memory arr) external pure returns (uint256) {
        assembly {
            // your code here
            // return the maximum value in the array
            // revert if array is empty
            let offset := calldataload(0x04)
            let length := calldataload(add(0x04, offset))
            switch length
            case 0 { revert(0, 0) }
            default {
                let offsetValue := add(0x24, offset)
                let max := calldataload(offsetValue)
                for { let i := 1 } lt(i, length) { i := add(i, 1) } {
                    offsetValue := add(0x20, offsetValue)
                    let value := calldataload(offsetValue)
                    if gt(value, max) { max := value }
                }
                mstore(0x00, max)
                return(0x00, 0x20)
            }
        }
    }
}
