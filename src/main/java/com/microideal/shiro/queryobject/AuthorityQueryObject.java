package com.microideal.shiro.queryobject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author microideal on 2018/9/26
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AuthorityQueryObject {
    private int sEcho;

    private int iDisplayStart;

    private int iDisplayLength;

    //TODO 可加其他查询条件
}
