// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteDynamicArrayToStorage {
    uint256[] public writeHere;

    function main(uint256[] calldata x) external {
        assembly {
            // your code here
            // write the dynamic calldata array `x` to storage variable `writeHere`
            let offset := calldataload(0x04)
            let length := calldataload(add(0x04, offset))
            let offsetValue := add(0x24, offset)
            sstore(0, length)
            mstore(0x00, 0x00)
            let h := keccak256(0x00, 0x20)
            for { let i := 0 } lt(i, length) { i := add(i, 1) } {
                sstore(add(h, i), calldataload(offsetValue))
                offsetValue := add(offsetValue, 0x20)
            }
        }
    }
}
