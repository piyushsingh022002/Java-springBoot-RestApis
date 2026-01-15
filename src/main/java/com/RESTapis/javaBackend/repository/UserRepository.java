package com.RESTapis.javaBackend.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.RESTapis.javaBackend.entity.User;

import ch.qos.logback.core.status.Status;

public interface UserRepository extends
        JpaRepository<User, UUID>, JpaSpecificationExecutor<User> {

    // find user by email
    Optional<User> findByEmail(String email);

    // find user by username
    Optional<User> findByUsername(String username);

    // @Query("""
    // SELECT u
    // FROM User u
    // WHERE LOWER(u.username) LIKE LOWER(CONCAT('%', :username, '%'))
    // """)
    // Page<User> searchByUsername(
    // @Param("username") String username,
    // Pageable pageable);

    @Query("SELECT u FROM User u WHERE u.status = :status")
    Page<User> findByStatus(@Param("status") Status status, Pageable pageable);

}
