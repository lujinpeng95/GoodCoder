package com.ruyuan.util;

public class InputsForRemoveDuplicates {
    public int[] nums;

    public InputsForRemoveDuplicates(String numStr) {
        String[] numberList = numStr.split(",");
        nums = new int[numberList.length];
        for (int i = 0; i < numberList.length; i++) {
            nums[i] = Integer.parseInt(numberList[i]);
        }
    }
}