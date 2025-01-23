// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract LengthOfDynamicArray {
    function main(uint256[] memory x) external view returns (uint256) {
        assembly {
            // your code here
            // return the length of array `x`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
            let offset := calldataload(0x04)
            calldatacopy(0x00, add(0x04, offset), 0x20)
            return(0x00, 0x20)
        }
    }
}
