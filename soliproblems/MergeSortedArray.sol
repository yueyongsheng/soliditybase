// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract MergeSortedArrays {
    // 合并两个有序数组
    function merge(
        uint256[] memory arr1,
        uint256[] memory arr2
    ) external pure returns (uint256[] memory) {
        uint256 len1 = arr1.length;
        uint256 len2 = arr2.length;
        uint256[] memory merged = new uint256[](len1 + len2);

        uint256 i = 0; // arr1的索引
        uint256 j = 0; // arr2的索引
        uint256 k = 0; // merged的索引

        // 比较两个数组的元素并合并
        while (i <  len1 && j <len2) {
            if (arr1[i] <= arr2[j]) {
                merged[k] = arr1[i];
                i++;
            } else {
                merged[k] = arr2[j];
                j++;
            }
            k++;
        }

        // 将arr1剩余的元素复制到merged
        while (i < len1) {
            merged[k] = arr1[i];
            i++;
            k++;
        }

        // 将arr2剩余的元素复制到merged
        while (j < len2) {
            merged[k] = arr2[j];
            j++;
            k++;
        }

        return merged;
    }
}