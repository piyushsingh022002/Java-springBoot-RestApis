package com.RESTapis.javaBackend.repository.specification;

import org.springframework.data.jpa.domain.Specification;

import com.RESTapis.javaBackend.entity.User;

public final class UserSpecification {

    private UserSpecification() {
        // private constructor to prevent instantiation
    }

    public static Specification<User> usernameContains(String username) {
        if (username == null || username.isBlank()) {
            return null;
        }

        return (root, query, cb) -> cb.like(
                cb.lower(root.get("username")),
                "%" + username.toLowerCase() + "%");
    }

    public static Specification<User> hasEmail(String email) {
        if (email == null || email.isBlank()) {
            return null;
        }

        return (root, query, cb) -> cb.equal(
                cb.lower(root.get("email")),
                email.toLowerCase());
    }

    public static Specification<User> hasRole(String roleName) {
        if (roleName == null || roleName.isBlank()) {
            return null;
        }

        return (root, query, cb) -> {
            query.distinct(true);
            var roleJoin = root.join("roles");

            return cb.equal(
                    cb.lower(roleJoin.get("name")),
                    roleName.toLowerCase());
        };
    }

}
