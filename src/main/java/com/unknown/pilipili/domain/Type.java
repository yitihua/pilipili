package com.unknown.pilipili.domain;

import com.unknown.pilipili.config.orm.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/31 23:18
 */

@Entity
@Table(name = "T_TYPE")
public class Type extends IdEntity {
    private String name;

    public Type() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
