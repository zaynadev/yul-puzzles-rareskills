// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract SquareRoot {
    function main(uint256 x) external pure returns (uint256) {
        assembly {
            // your code here
            // return the square root of x rounded down
            // e.g. root(4) = 2 root(5) = 2 root(6) = 2, ..., root(8) = 2, root(9) = 3
            // hint: https://www.youtube.com/watch?v=CnMBo5nG_zk
            // hint: use x / 2 as initial guess
            // hint: be careful of overflow
            // hint: use a switch statement to handle 0, 1, and the general case
            // hint: use break to exit the loop if the new guess is the same as the old guess

            // Handle special cases
            switch x
            case 0 {
                mstore(0, 0)
                return(0, 0x20)
            }
            case 1 {
                mstore(0, 1)
                return(0, 0x20)
            }
            default {
                // For x > 1, implement binary search
                // We know the square root lies between 1 and x
                let z := 1 // Lower bound
                let y := x // Upper bound

                // Binary search loop
                for {} 1 {} {
                    // Find midpoint between z and y
                    // We add 1 to handle odd differences
                    let mid := add(z, div(sub(y, z), 2))

                    // Calculate mid * mid carefully to avoid overflow
                    // If mid * mid > x, new upper bound is mid
                    // If mid * mid <= x, new lower bound is mid

                    // To compare mid * mid with x without overflow:
                    // If x < mid, then mid * mid > x (since mid > 0)
                    // Otherwise, compute x/mid and compare with mid
                    let shouldUpdate := 0
                    if lt(x, mid) {
                        // mid * mid is definitely > x
                        y := mid
                    }
                    {
                        let quotient := div(x, mid)
                        if gt(mid, quotient) {
                            // mid * mid > x
                            y := mid
                        }
                        if lt(mid, quotient) {
                            // mid * mid < x
                            z := mid
                        }
                        if eq(mid, quotient) {
                            // mid * mid = x (exact square root found)
                            mstore(0, mid)
                            return(0, 0x20)
                        }
                    }

                    // If bounds are adjacent, we've found our answer
                    if eq(add(z, 1), y) {
                        mstore(0, z)
                        return(0, 0x20)
                    }
                }
            }
        }
    }
}
