//SPDX-License-Identifier:MIT
pragma solidity ^0.8.26;

contract calculator{
     uint result = 0;
    function add(uint120 num) public {
        result +=num;
    }
    function substract(uint120 num) public {
        result -=num;
    }
    function multiply(uint120 num ) public{
        result *= num;
    }
    function getresult() public view returns (uint256){
        return result;

    }
}