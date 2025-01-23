// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract RevertWithPanic {
    function main() external pure {
        assembly {
            // your code here
            // revert the function with an error of type `Panic(uint256)`
            // use "0x01" as error code
            // Hint: The error type is built-in and cannot be re-defined. See https://www.rareskills.io/post/try-catch-solidity
            let selector := shl(224, 0x4e487b71)
            mstore(0x00, selector)
            mstore(0x04, 0x01)
            revert(0x00, 0x24)
        }
    }
}
