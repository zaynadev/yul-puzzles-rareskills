// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract RevertWithSelector {
    error RevertData(); // selector: 0xa3b7e096

    function main() external pure {
        assembly {
            // your code here
            // revert with the custom error "RevertData"
            // hint: https://www.rareskills.io/post/assembly-revert
        }
    }
}
