// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToDynamicArray {
    uint256[] writeHere;

    function main(uint256[] memory x) external {
        assembly {
            // your code here
            // store the values in the DYNAMIC array `x` in the storage variable `writeHere`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
            let offset := calldataload(0x04)
            let length := calldataload(add(0x04, offset))
            sstore(0, length)
            mstore(0x00, 0x00)
            let h := keccak256(0x00, 0x20)
            let offsetValue := add(0x24, offset)
            for { let i := 0 } lt(i, length) { i := add(i, 1) } {
                sstore(add(h, i), calldataload(offsetValue))
                offsetValue := add(0x20, offsetValue)
            }
        }
    }

    function getter() external view returns (uint256[] memory) {
        return writeHere;
    }
}
