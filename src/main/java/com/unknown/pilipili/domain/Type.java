package com.unknown.pilipili.domain;

import com.unknown.pilipili.config.orm.IdEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/24 23:47
 */
@Entity
@Table(name = "T_TYPE")
public class Type extends IdEntity {
    @Column(length = 128,unique = true,nullable = false)
    private String typeName;

    public Type(){}
    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}
