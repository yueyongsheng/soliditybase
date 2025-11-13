// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract StringReverser {
    function reverse(string calldata s) external pure returns (string memory) {
        bytes memory input = bytes(s); 
        uint256 length = input.length;
        bytes memory output = new bytes(length); 

        for (uint256 i = 0; i < length; i++) {
            output[i] = input[length - 1 - i]; 
        }

        return string(output); 
    }

}