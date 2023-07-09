package com.ruyuan.twosum.course;

import com.ruyuan.util.InputsForTwoNumberSum;

import java.util.HashMap;


public class TwoSum {
    public int[] twoSum(int[] nums, int target) {
        int[] ret = new int[2];

        HashMap<Integer, Integer> hashMap = new HashMap<>();
        //将nums转录成Hash表
        for (int i = 0; i < nums.length; i++) {
            hashMap.put(nums[i], i);
        }
        //算法主体
        for (int i = 0; i < nums.length; i++) {
            if (hashMap.containsKey(target - nums[i])) {
                int j = hashMap.get(target - nums[i]);
                //nums =[3], target = 6.
                if (i != j) {
                    return new int[]{i, j};
                }
            }
        }

        return ret;
    }


    public static void main(String args[]) {
        InputsForTwoNumberSum inputs = new InputsForTwoNumberSum("-1,10,2,9,10,6,5", "20");
        TwoSum ins = new TwoSum();

        for (int i : ins.twoSum(inputs.nums, inputs.target)) {
            System.out.println(i);
        }
    }
}
