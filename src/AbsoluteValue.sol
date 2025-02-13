// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract AbsoluteValue {
    function main(int256 x) external pure returns (uint256) {
        assembly {
            // your code here
            // return the absolute value of x
            // hint: use signed comparisons
            // hint: https://www.rareskills.io/post/signed-int-solidity
            // slt(x, 0) returns 1 if x < 0, and 0 otherwise
            switch slt(x, 0)
            case 0 {
                // If x >= 0, just return x as is
                mstore(0, x)
                return(0, 0x20)
            }
            case 1 {
                // If x < 0, return -x
                mstore(0, sub(0, x))
                return(0, 0x20)
            }
        }
    }
}
