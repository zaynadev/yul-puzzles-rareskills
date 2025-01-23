// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToPacked128 {
    uint128 public writeHere = 1;
    uint128 public someValue = 7;

    function main(uint256 v) external {
        assembly {
            // your code here
            // change the value of `writeHere` storage variable to `v`
            // be careful not to alter the value of `someValue` variable
            // Hint: storage slots are arranged sequentially. Determine the storage slot of `writeHere`
            // and use `sstore` to modify only the `writeHere` variable.
            /*
            let value := sload(0)
            let firstValue := v
            let secondValue := shl(shr(128, value), 128)
            mstore(0x00, secondValue)
            mstore(0x10, shl(128, firstValue))
            sstore(0, mload(0x00))
            */
            let value := sload(0)
            let mask1 := sub(shl(128, 1), 1)
            let mask2 := not(mask1)

            let fistValue := and(mask1, v)
            let secondValue := and(mask2, value)

            sstore(0, or(fistValue, secondValue))
        }
    }
}
