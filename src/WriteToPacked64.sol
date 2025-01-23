// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToPacked64 {
    uint64 public someValue1 = 7;
    uint64 public writeHere = 1;
    uint64 public someValue2 = 7;
    uint64 public someValue3 = 7;

    function main(uint256 v) external {
        assembly {
            // your code here
            // change the value of `writeHere` storage variable to `v`
            // be careful not to alter the value of `someValue` variable
            let value := sload(0)
            let mask1 := sub(shl(64, 1), 1)
            let mask2 := shl(128, sub(shl(128, 1), 1))
            let mask := or(mask1, mask2)
            value := and(value, mask)
            sstore(0, or(value, shl(64, v)))
        }
    }
}
