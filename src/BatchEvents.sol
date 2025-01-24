// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract BatchEvents {
    // EMIT ME!!!
    event MyEvent(address indexed emitter, bytes32 indexed id, uint256 num);

    function main(address[] memory emitters, bytes32[] memory ids, uint256[] memory nums) external {
        assembly {
            // your code here
            // emit the `MyEvent(address,bytes32,uint256)` event
            // Assuming all arrays (emitters, ids, and nums) are of equal length.
            // iterate over the set of parameters and emit events based on the array length.
            mstore(0x00, "MyEvent(address,bytes32,uint256)")
            let sig := keccak256(0x00, 0x20)
            let offset1 := calldataload(0x04)
            let offset2 := calldataload(0x24)
            let offset3 := calldataload(0x44)

            let offsetLength1 := add(0x04, offset1)
            let offsetLength2 := add(0x04, offset2)
            let offsetLength3 := add(0x04, offset3)

            let length1 := calldataload(offsetLength1)

            let offsetMemory := 0x20
            for { let i := 0 } lt(i, length1) { i := add(i, 1) } {
                mstore(0x00, calldataload(add(offsetLength3, 0x20)))
                log3(0x00, 0x20, sig, calldataload(add(offsetLength1, 0x20)), calldataload(add(offsetLength2, 0x20)))

                offsetLength1 := add(offsetLength1, 0x20)
                offsetLength2 := add(offsetLength2, 0x20)
                offsetLength3 := add(offsetLength3, 0x20)
            }
        }
    }
}
