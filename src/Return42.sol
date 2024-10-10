// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract Return42 {

  function main() external pure returns (uint256) {
      assembly {
          // your code here
          // return 42 in decimal
      }
  }
}
