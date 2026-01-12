package com.RESTapis.javaBackend.entity;

import java.util.HashSet;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

import java.util.Set;

public class Role extends BaseEntity {
    @NotBlank
    @Column(unique = true, nullable = false)
    private String name;

    @ManyToMany(mappedBy = "roles")
    private Set<User> users = new HashSet<>();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
