package com.unknown.pilipili.domain;

import com.unknown.pilipili.config.orm.IdEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

/**
 * @author <b>顾思宇</b>
 * @version 1.0, 2019/5/24 22:07
 */
@Entity
@Table(name = "T_USER")
public class User extends IdEntity {
    @Column(length = 128,unique = true,nullable = false)
    private String username;
    @Column(length = 128,nullable = false)
    private String password;
    private String avatar;
    @ManyToOne
    @JoinColumn(name = "gender",referencedColumnName = "id")
    private Dict gender;
    @ManyToOne
    @JoinColumn(name = "education",referencedColumnName = "id")
    private Dict education;

    private LocalDateTime createAt = LocalDateTime.now();

    @ManyToMany
    @JoinTable(name = "T_USER_ROLE", joinColumns = {@JoinColumn(name = "user_id")},inverseJoinColumns = {@JoinColumn(name = "role_id")})
    private Set<Role> roles = new HashSet<>();

    private String salt;

    public User(){}
    public User(String username,String password){
        this.username = username;
        this.password = password;
    }

    public User(String username, String password, Dict gender, Dict education) {
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.education = education;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Dict getGender() {
        return gender;
    }

    public void setGender(Dict gender) {
        this.gender = gender;
    }

    public Dict getEducation() {
        return education;
    }

    public void setEducation(Dict education) {
        this.education = education;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }
}
