package com.microideal.shiro.queryobject;

import com.microideal.shiro.model.Admin;

/**
 * Created by Administrator on 2016/9/20.
 */
public class AdminForm extends BaseForm {

    private Admin entity = new Admin();

    public Admin getEntity() {
        return entity;
    }

    public void setEntity(Admin entity) {
        this.entity = entity;
    }

}
