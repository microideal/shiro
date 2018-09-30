package com.microideal.shiro.model;

import com.microideal.shiro.command.AuthorityCmd;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author microideal on 2018/9/23
 */
@Table(name = "t_authority")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Authority implements Serializable{

    private static final long serialVersionUID = 8736658045315083846L;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Column(name = "parentId")
    private Long parentId;

    private Integer sort;

    private Integer type;

    private String value;

    @Transient
    private Boolean checked;//该权限是否被角色使用

    @Transient
    private List<Authority> authorityList = new ArrayList<>();

    public Authority(AuthorityCmd cmd){
        this.setId(cmd.getId());
        this.setName(cmd.getName());
        this.setValue(cmd.getValue());
        this.setSort(cmd.getSort());
        this.setParentId(cmd.getParentId());
        this.setType(cmd.getType());
    }
}
