// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract DeployNBytes {
    function main(uint256 size) external returns (address) {
        assembly {
            // your code here
            // create a contract that is size bytes long
            // hint: you will need to generalize the init code of DeployOneByte
            // hint: use mstore8 to target a single byte
            // hint: because we only care about the size, you can simply return that region
            //       of memory and not care about what is inside it

            // First, store PUSH1 opcode (0x60) - this will push the size of data to return
            mstore8(0, 0x60)
            // Store the size byte
            mstore8(1, size)

            // Store PUSH1 again for the memory position (0)
            mstore8(2, 0x60)
            mstore8(3, 0x00)

            // Store the RETURN opcode (0xF3)
            mstore8(4, 0xF3)

            // Now we need to store the actual bytes that will become our contract
            // We'll store them starting at position 5 in memory

            // Fill the desired number of bytes with any value (we'll use 0x60)
            // We use a loop since the size is dynamic
            let i := 0
            for {} lt(i, size) { i := add(i, 1) } { mstore8(add(5, i), 0x60) }

            // Create the contract using create()
            // Parameters: value (0), memory offset (0), length (size + 5)
            // The length includes our 5 bytes of initialization code plus the desired size
            let deployed := create(0, 0, add(size, 5))

            // Return the deployed contract's address
            mstore(0, deployed)
            return(0, 0x20)
        }
    }
}
