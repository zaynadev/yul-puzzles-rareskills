// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract FizzBuzz {
    function main(uint256 num) external pure returns (string memory) {
        assembly {
            // your code here
            // if `num` is divisible by 3 return the word "fizz",
            // if divisible by 5 with the word "buzz",
            // if divisible by both 3 and 5 return the word "fizzbuzz",
            // else return an empty string "".

            // Assume `num` is greater than 0.

            let isDiv3 := iszero(mod(num, 3))
            let isDiv5 := iszero(mod(num, 5))

            let s := ""

            if isDiv3 { s := "fizz" }
            if isDiv5 { s := "buzz" }
            if and(isDiv3, isDiv5) { s := "fizzbuzz" }

            let length := 0
            switch s
            case "buzz" { length := 4 }
            case "fizz" { length := 4 }
            case "fizzbuzz" { length := 8 }

            mstore(0x00, 0x20)
            mstore(0x20, length)
            mstore(0x40, s)
            return(0x00, 0x60)
        }
    }
}
