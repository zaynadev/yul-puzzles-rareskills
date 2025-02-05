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

            let ptr := mload(0x40)
            let size := sub(calldatasize(), 68)
            calldatacopy(ptr, 68, size)
            let addr := create(0, ptr, size)
            mstore(0, addr)
            return(0, 32)
        }
    }
}