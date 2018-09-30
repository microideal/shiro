package com.microideal.shiro.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @author microideal on 2018/9/25
 */
@Table(name = "t_role")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Role implements Serializable {

    private static final long serialVersionUID = 3006658045315083846L;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String value;

    @Transient
    private Integer selected;

    public Role(Long id,String name,String value){
        this.setId(id);
        this.setName(name);
        this.setValue(value);
    }

}
