package com.microideal.shiro.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * @author microideal on 2018/9/27
 */
@Table(name = "t_user_roles")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserRoles implements Serializable {
    private static final long serialVersionUID = 3006458001015083876L;
    @Column(name = "user_id")
    private Long userId;

    @Column(name = "role_id")
    private Long roleId;
}
