// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteTwoDynamicArraysToStorage {
    uint256[] public writeHere1;
    uint256[] public writeHere2;

    function main(uint256[] calldata x, uint256[] calldata y) external {
        assembly {
            // your code here
            // write the dynamic calldata array `x` to storage variable `writeHere1` and
            // dynamic calldata array `y` to storage variable `writeHere2`
            let offset1 := calldataload(0x04)
            let offset2 := calldataload(0x24)
            let length1 := calldataload(add(0x04, offset1))
            let length2 := calldataload(add(0x04, offset2))
            let offsetValue1 := add(0x24, offset1)
            let offsetValue2 := add(0x24, offset2)
            mstore(0x00, 0x00)
            let h1 := keccak256(0x00, 0x20)
            mstore(0x00, 0x01)
            let h2 := keccak256(0x00, 0x20)
            sstore(0, length1)
            sstore(1, length2)
            for { let i := 0 } lt(i, length1) { i := add(i, 1) } {
                sstore(add(h1, i), calldataload(offsetValue1))
                offsetValue1 := add(offsetValue1, 0x20)
            }
            for { let i := 0 } lt(i, length2) { i := add(i, 1) } {
                sstore(add(h2, i), calldataload(offsetValue2))
                offsetValue2 := add(offsetValue2, 0x20)
            }
        }
    }
}
