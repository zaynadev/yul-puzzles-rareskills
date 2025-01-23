// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract keccakX {
    function main(uint256 x) external pure returns (bytes32) {
        assembly {
            // your code here
            // return the keccak hash of x
            // Hint: use keccak256(offset, size)
            // Hint: you need to put x in memory first
            mstore(0x00, x)
            let h := keccak256(0x00, 0x20)
            mstore(0x00, h)
            return(0x00, 0x20)
        }
    }
}
