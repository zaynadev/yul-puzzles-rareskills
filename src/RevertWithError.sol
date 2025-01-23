// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract RevertWithError {
    function main() external pure {
        assembly {
            // revert the function with an error of type `Error(string)`
            // use "RevertRevert" as error message
            // Hint: The error type is a predefined four bytes. See https://www.rareskills.io/post/try-catch-solidity
            let selector := shl(224, 0x08c379a0)
            mstore(0x00, selector)
            mstore(0x04, 0x20)
            mstore(0x24, 12)
            mstore(0x44, "RevertRevert")
            revert(0x00, 0x64)
        }
    }
}
