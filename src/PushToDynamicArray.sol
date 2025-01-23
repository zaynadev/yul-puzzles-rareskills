// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract PushToDynamicArray {
    uint256[] pushToMe = [23, 4, 19, 3, 44, 88];

    function main(uint256 newValue) external {
        assembly {
            // your code here
            // push the newValue to the dynamic array `pushToMe`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
            mstore(0x00, 0x00)
            let h := keccak256(0x00, 0x20)
            let length := sload(0)
            sstore(add(length, h), newValue)
            sstore(0, add(length, 1))
        }
    }

    function getter() external view returns (uint256[] memory) {
        return pushToMe;
    }
}
