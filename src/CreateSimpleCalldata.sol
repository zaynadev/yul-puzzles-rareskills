// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract CreateSimpleCalldata {
    function main(bytes calldata deploymentBytecode) external returns (address) {
        assembly {
            // your code here
            // create a contract using the deploymentBytecode
            // return the address of the contract
            // hint: use the `create` opcode
            // hint: use calldatacopy to copy the deploymentBytecode to memory
            let lengthOffset := add(calldataload(0x04), 0x04)
            let length := calldataload(lengthOffset)
            let dataOffset := add(lengthOffset, 0x20)
            calldatacopy(0, dataOffset, length)
            let addr := create(0, 0, length)
            mstore(0x00, addr)
            return(0x00, 0x20)
        }
    }
}
