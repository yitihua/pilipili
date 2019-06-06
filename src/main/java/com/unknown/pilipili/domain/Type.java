package com.unknown.pilipili.domain;

import com.unknown.pilipili.config.orm.IdEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/31 23:18
 */

@Entity
@Table(name = "T_TYPE")
public class Type extends IdEntity {
    @Column(nullable = false)
    private String name;
    @Column(nullable = false)
    private String engName;

    public Type() {
    }

    public Type(String name,String engName) {
        this.name = name;
        this.engName = engName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEngName() {
        return engName;
    }

    public void setEngName(String engName) {
        this.engName = engName;
    }
}
