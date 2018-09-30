package com.microideal.shiro.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author microideal on 2018/9/26
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoleCmd {

    private Long id;

    private String name;

    private String value;
}
