// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract Division {
    function main(int256 x, int256 y) external pure returns (int256) {
        assembly {
            // your code here
            // x and y can be negative or positive
            // return x / y
            // if y == 0 revert
            // First, check for division by zero and revert if true
            if eq(y, 0) { revert(0, 0) }

            // Get the absolute values of x and y
            // In two's complement, for negative numbers:
            // abs(n) = sub(0, n) if n < 0
            //        = n         if n >= 0
            let absX := x
            if slt(x, 0) { absX := sub(0, x) }

            let absY := y
            if slt(y, 0) { absY := sub(0, y) }

            // Perform unsigned division on absolute values
            let absResult := div(absX, absY)

            // Determine the sign of the result
            // XOR the signs of x and y:
            // - If both are negative or both positive, result is positive
            // - If one is negative and one positive, result is negative
            let resultIsNegative := xor(slt(x, 0), slt(y, 0))

            // Apply the sign to our result
            let result := absResult
            if resultIsNegative { result := sub(0, absResult) }

            // Store and return the result
            mstore(0x00, result)
            return(0x00, 0x20)
        }
    }
}
