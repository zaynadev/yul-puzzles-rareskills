// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract Log2 {
    function main(uint256 x) external pure returns (uint256) {
        assembly {
            // your code here
            // return log2 of x rounded down
            // revert if x is 0
            // hint: log2 is the index of the highest bit that is set in x
            // for example:
            //   bin(1) = 0001, so log2(2) = 0
            //   bin(2) = 0010, so log2(2) = 1
            //   bin(3) = 0011, so log2(3) = 1
            //   bin(4) = 0100, so log2(4) = 2
            //   bin(5) = 0101, so log2(5) = 2
            //   bin(6) = 0110, so log2(6) = 2
            //   bin(7) = 0111, so log2(6) = 2
            //   bin(8) = 1000, so log2(6) = 3

            // First, check if x is 0 and revert if it is
            // Log2(0) is undefined mathematically
            if iszero(x) { revert(0, 0) }

            // To find log2, we need to find the position of the highest set bit
            // We'll do this by repeatedly shifting right and counting shifts
            // until we find the highest 1 bit

            // Initialize our result to 0
            let result := 0

            // First, check if x has any bits set in the upper 128 bits
            // If yes, we can skip checking the lower bits
            if iszero(lt(x, 0x100000000000000000000000000000000)) {
                result := 128
                // Keep only the upper 128 bits by shifting right
                x := shr(128, x)
            }

            // Check upper 64 bits of our remaining number
            if iszero(lt(x, 0x10000000000000000)) {
                result := add(result, 64)
                x := shr(64, x)
            }

            // Check upper 32 bits
            if iszero(lt(x, 0x100000000)) {
                result := add(result, 32)
                x := shr(32, x)
            }

            // Check upper 16 bits
            if iszero(lt(x, 0x10000)) {
                result := add(result, 16)
                x := shr(16, x)
            }

            // Check upper 8 bits
            if iszero(lt(x, 0x100)) {
                result := add(result, 8)
                x := shr(8, x)
            }

            // Check upper 4 bits
            if iszero(lt(x, 0x10)) {
                result := add(result, 4)
                x := shr(4, x)
            }

            // Check upper 2 bits
            if iszero(lt(x, 0x4)) {
                result := add(result, 2)
                x := shr(2, x)
            }

            // Check the penultimate bit
            if iszero(lt(x, 0x2)) { result := add(result, 1) }

            // Store and return the result
            mstore(0, result)
            return(0, 0x20)
        }
    }
}
