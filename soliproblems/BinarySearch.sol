
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract BinarySearch {
    function search(int256[] memory nums, int256 target) public pure returns (uint256) {
        uint256 left = 0;
        uint256 right = nums.length - 1;

        while (left <= right) {
            // 计算中间索引：避免溢出
            uint256 mid = left + (right - left) / 2;

            if (nums[mid] == target) {
                return mid;
            } else if (nums[mid] < target) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        // 返回最大uint256值表示未找到（相当于-1）
        return type(uint256).max;
    }
}