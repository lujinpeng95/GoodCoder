package com.ruyuan.twosum.solution;

import com.ruyuan.util.InputsForTwoNumberSum;

import java.util.Random;

/**
 * 暴力求解算法：随机算法
 *
 * @author mengjie
 */
public class TwoSumRandom {

    public int[] twoSumRandom(int[] nums, int target) {
        int[] ret = new int[2];

        Random r = new Random();
        int len = nums.length;
        for(int count = 0; count<= 10* len* len ; count++){
            int i = r.nextInt(nums.length);
            int j;
            do{
                j =  r.nextInt(nums.length);
            }while(i==j);
            if(nums[i] + nums[j] == target){
                return new int[]{i,j};
            }
        }

        return ret;
    }

    public static void main(String args[]) {
        InputsForTwoNumberSum inputs = new InputsForTwoNumberSum("2,7,11,15", "26");
        TwoSumRandom ins = new TwoSumRandom();
        for (int i : ins.twoSumRandom(inputs.nums, inputs.target)) {
            System.out.println(i);
        }
    }
}
