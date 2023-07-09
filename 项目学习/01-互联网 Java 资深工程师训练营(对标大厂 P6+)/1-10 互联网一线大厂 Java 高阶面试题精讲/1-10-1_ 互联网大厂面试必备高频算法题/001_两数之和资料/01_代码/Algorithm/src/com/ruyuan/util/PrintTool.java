package com.ruyuan.util;

public class PrintTool {
    public void printArray(int[] nums) {
        System.out.println("数组长度：" + nums.length + ";");
        System.out.print("数组：[");
        for (int i = 0; i < nums.length; i++) {
            System.out.print(nums[i]);
            if (i < nums.length - 1) {
                System.out.print(",");
            }
        }
        System.out.print("]");
    }

}
