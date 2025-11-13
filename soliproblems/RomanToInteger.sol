// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract RomanConverter {
    function romanToInt(string calldata s) external pure returns (uint256) {
        bytes memory romanBytes = bytes(s);  
        uint256 result = 0;
        uint256 prevValue = 0;

        for (uint256 i = 0; i < romanBytes.length; i++) {
            uint256 currentValue = _getRomanValue(romanBytes[i]);  

            if (currentValue > prevValue) {
                result += currentValue - 2 * prevValue;  // 处理 "IV", "IX" 等情况
            } else {
                result += currentValue;
            }

            prevValue = currentValue;
        }

        return result;
    }

    function _getRomanValue(bytes1 romanChar) private pure returns (uint256) {
        if (romanChar == 'I') return 1;
        if (romanChar == 'V') return 5;
        if (romanChar == 'X') return 10;
        if (romanChar == 'L') return 50;
        if (romanChar == 'C') return 100;
        if (romanChar == 'D') return 500;
        if (romanChar == 'M') return 1000;
        return 0;  
    }
}