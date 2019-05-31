package com.unknown.pilipili.domain;

import com.unknown.pilipili.config.orm.IdEntity;
import com.unknown.pilipili.util.Constants;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/31 23:02
 */
@Entity
@Table(name = "T_ROLE")
public class Role extends IdEntity {
    private String name;
    private Constants.Status status= Constants.Status.DISABLE;

    public Role() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Constants.Status getStatus() {
        return status;
    }

    public void setStatus(Constants.Status status) {
        this.status = status;
    }
}
