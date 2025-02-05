pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {CreateSimple} from "../src/CreateSimple.sol";

contract Simple {
    constructor() payable {}
    function fallback() external payable {}
}
