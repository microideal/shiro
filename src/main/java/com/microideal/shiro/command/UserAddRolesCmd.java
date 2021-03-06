package com.microideal.shiro.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author microideal on 2018/9/27
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserAddRolesCmd {
    private Long userId;

    private List<Long> roleIds;
}
