// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract Calculator {
    // perform the arithmetic operations assumming they won't overflow

    function add(uint256 x, uint256 y) external pure returns (uint256) {
        assembly {
            // your code here
            // add x and y
        }
    }

    function sub(uint256 x, uint256 y) external pure returns (uint256) {
        assembly {
            // your code here
            // subtract y from x
        }
    }

    function mul(uint256 x, uint256 y) external pure returns (uint256) {
        assembly {
            // your code here
            // multiply x by y
        }
    }

    function div(uint256 x, uint256 y) external pure returns (uint256) {
        assembly {
            // your code here
            // div x by y
        }
    }
}
