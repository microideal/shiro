package com.microideal.shiro.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author microideal on 2018/9/25
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RoleAddAuthoritiesCmd {
    private Long roleId;

    private List<Long> authorityIds;
}
