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
public class AuthorityCmd {
    private Long id;

    private String name;

    private Long parentId;

    private Integer sort;

    private Integer type;

    private String value;
}
