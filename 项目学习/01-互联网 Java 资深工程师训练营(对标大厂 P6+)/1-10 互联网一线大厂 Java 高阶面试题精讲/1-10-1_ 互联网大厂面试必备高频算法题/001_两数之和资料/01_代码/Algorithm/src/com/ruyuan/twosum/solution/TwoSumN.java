package com.ruyuan.twosum.solution;

import com.ruyuan.util.InputsForTwoNumberSum;

import java.util.HashMap;

/**
 * Hash表求解
 *
 * @author mengjie
 */
public class TwoSumN {
    public int[] twoSum(int[] nums, int target) {
        int[] ret = new int[2];

        HashMap<Integer, Integer> hashMap = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            hashMap.put(nums[i], i);
        }
        for (int i = 0; i < nums.length; i++) {
            if (hashMap.containsKey(target - nums[i])) {
                int j = hashMap.get(target - nums[i]);
                if (i != j) {
                    return new int[]{i, hashMap.get(target - nums[i])};
                }
            }
        }
        return ret;
    }

    public static void main(String args[]) {
        InputsForTwoNumberSum inputs = new InputsForTwoNumberSum("9,4,5,2,7,11,4,15", "8");
        TwoSumN ins = new TwoSumN();

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
