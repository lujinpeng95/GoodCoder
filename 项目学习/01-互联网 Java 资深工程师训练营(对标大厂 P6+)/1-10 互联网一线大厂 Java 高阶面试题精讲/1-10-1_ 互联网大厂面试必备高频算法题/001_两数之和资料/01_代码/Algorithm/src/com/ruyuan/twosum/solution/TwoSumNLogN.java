package com.ruyuan.twosum.solution;

import com.ruyuan.util.InputsForTwoNumberSum;

import java.util.Arrays;

/**
 * 二分搜索求解
 *
 * @author mengjie
 */
public class TwoSumNLogN {

    public int[] twoSum(int[] nums, int target) {
        int[] sortedNums = nums.clone();
        Arrays.sort(sortedNums);
        int[] ret = new int[2];
        ret[0] = -1;
        ret[1] = -1;

        for (int i = 0; i < sortedNums.length; i++) {
            int index = findNumIndexInSortedArray(sortedNums, i + 1, target - sortedNums[i]);
            if (index != -1) {
                ret[0] = getNumberIndex(nums, sortedNums[i], -1);
                ret[1] = getNumberIndex(nums, sortedNums[index], ret[0]);
                return ret;
            }
        }
        return ret;
    }

    public int getNumberIndex(int[] nums, int num, int forbiddenIndex) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == num && i != forbiddenIndex) {
                return i;
            }
        }
        return -1;
    }

    public int findNumIndexInSortedArray(int[] sortedNums, int startIndex, int num) {
        int index = -1;
        int leftIndex = startIndex;
        int rightIndex = sortedNums.length - 1;
        while (leftIndex <= rightIndex) {
            int midIndex = (rightIndex - leftIndex) / 2 + leftIndex;
            if (sortedNums[midIndex] == num) {
                return midIndex;
            } else if (sortedNums[midIndex] > num) {
                rightIndex = midIndex - 1;
            } else if (sortedNums[midIndex] < num) {
                leftIndex = midIndex + 1;
            }
        }
        return index;
    }

    public static void main(String args[]) {
        InputsForTwoNumberSum inputs = new InputsForTwoNumberSum("0,4,2,1,2,3,2,3,4,4,4", "8");
        TwoSumNLogN ins = new TwoSumNLogN();

//        Arrays.sort(inputs.nums);
//        for(int i: inputs.nums){
//            System.out.println(i);
//        }
//        System.out.println( ins.findNumIndexInSortedArray(inputs.nums, 2) );

        for (int i : ins.twoSum(inputs.nums, inputs.target)) {
            System.out.println(i);
        }
    }
}
