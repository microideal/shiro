package com.microideal.shiro.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.Column;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * @author microideal on 2018/9/25
 */
@Table(name = "t_role_authorities")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RoleAuthorities implements Serializable {

    private static final long serialVersionUID = 3006458095015083846L;

    @Column(name = "role_id")
    private Long roleId;

    @Column(name = "authority_id")
    private Long authorityId;

}
