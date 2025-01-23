// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract IsPrime {
    function main(uint256 x) external pure returns (bool) {
        assembly {
            // your code here
            // return true if x is a prime number, else false
            // 1. check if the number is a multiple of 2 or 3
            // 2. loop from 5 to x / 2 to see if it is divisible
            // 3. increment the loop by 2 to skip the even numbers
            let isPrime := 0x01
            switch x
            case 1 { isPrime := 0x00 }
            default {
                for { let i := 2 } lt(i, div(x, 2)) { i := add(i, 1) } {
                    if iszero(mod(x, i)) {
                        isPrime := 0x00
                        break
                    }
                }
            }

            mstore(0x00, isPrime)
            return(0x00, 0x20)
        }
    }
}
