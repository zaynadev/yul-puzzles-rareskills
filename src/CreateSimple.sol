// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract CreateSimple {
    function main(bytes memory deploymentBytecode) external returns (address addr) {
        assembly {
            // your code here
            // create a contract using the deploymentBytecode
            // return the address of the contract
            // hint: use the `create` opcode
            // hint: the bytecode is already in memory
            let lenght := mload(deploymentBytecode)
            let dataOffset := add(deploymentBytecode, 0x20)
            addr := create(0, dataOffset, add(dataOffset, lenght))
            mstore(0x00, addr)
            return(0x00, 0x20)
        }
    }
}
