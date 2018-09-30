package com.microideal.shiro.enums;

/**
 * @author microideal on 2018/9/26
 */
public enum MenuTypeEnum {
    LEVEL_1_MENU(0),LEVEL_2_MENU(1),BUTTONS(2);

    private int value;

    public int getValue() {
        return value;
    }

    MenuTypeEnum(int value) {
        this.value = value;
    }
}
