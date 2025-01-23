// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToFixedArray {
    uint256[5] writeHere;

    function main(uint256[5] memory x) external {
        assembly {
            // your code here
            // store the values in the fixed array `x` in the storage variable `writeHere`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
            sstore(0, calldataload(0x04))
            sstore(1, calldataload(0x24))
            sstore(2, calldataload(0x44))
            sstore(3, calldataload(0x64))
            sstore(4, calldataload(0x84))
        }
    }

    function getter() external view returns (uint256[5] memory) {
        return writeHere;
    }
}
