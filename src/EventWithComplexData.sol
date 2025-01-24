// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract EventWithComplexData {
    // EMIT ME!!!
    event MyEvent(address indexed emitter, address[] players, uint256[] scores);

    function main(address emitter, address[] memory players, uint256[] memory scores) external {
        assembly {
            // your code here
            // emit the `MyEvent(address,address[],uint256[])` event
            // Hint: Use `log2` to emit the event with the hash as the topic0 and `emitter` as topic1,
            // then the data
            mstore(0x00, "MyEvent(address,address[],uint25")
            mstore(0x20, "6[])")
            let sig := keccak256(0x00, 0x24)

            let offset1 := calldataload(0x24)
            let offset2 := calldataload(0x44)
            let offsetLength1 := add(offset1, 0x04)
            let offsetLength2 := add(offset2, 0x04)
            let length1 := calldataload(offsetLength1)
            let length2 := calldataload(offsetLength2)

            mstore(0x00, 0x40)
            mstore(0x20, add(0x60, mul(length1, 0x20)))
            mstore(0x40, length1)
            let memryOffset := 0x60
            let dataOffset1 := add(0x20, offsetLength1)
            for { let i := 0 } lt(i, length1) { i := add(i, 1) } {
                mstore(memryOffset, calldataload(dataOffset1))
                memryOffset := add(0x20, memryOffset)
                dataOffset1 := add(0x20, dataOffset1)
            }
            mstore(memryOffset, length2)
            let dataOffset2 := add(0x20, offsetLength2)
            for { let i := 0 } lt(i, length2) { i := add(i, 1) } {
                memryOffset := add(0x20, memryOffset)
                mstore(memryOffset, calldataload(dataOffset2))
                dataOffset2 := add(0x20, dataOffset2)
            }

            log2(0x00, mul(add(add(length1, length2), 4), 0x20), sig, emitter)
        }
    }
}
