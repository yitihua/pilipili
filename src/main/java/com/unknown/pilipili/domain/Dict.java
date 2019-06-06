package com.unknown.pilipili.domain;

import com.unknown.pilipili.config.orm.IdEntity;
import com.unknown.pilipili.util.Constants;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/31 22:30
 */
@Entity
@Table(name = "T_DICT")

public class Dict extends IdEntity {
    private String type;
    private String name;
    private Constants.Status status;

    public Dict() {
    }

    public Dict(String type, String name) {
        this.type = type;
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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
