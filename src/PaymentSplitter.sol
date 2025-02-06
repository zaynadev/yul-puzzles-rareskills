// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract PaymentSplitter {
    function main(address[] calldata recipients) external payable {
        assembly {
            // your code here
            // send the entire contract balance to the recipients
            // each recipient gets balance / recipients.length

            let length := calldataload(0x24)
            let bal := div(selfbalance(), length)
            let recipientOffset := add(calldataload(0x04), 0x24)
            for { let i := 0 } lt(i, length) { i := add(i, 1) } {
                let ok := call(gas(), calldataload(recipientOffset), bal, 0, 0, 0, 0)
                recipientOffset := add(recipientOffset, 0x20)
            }
        }
    }
}
