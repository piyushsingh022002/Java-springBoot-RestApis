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

public interface UserRepository extends
        JpaRepository<User, UUID>, JpaSpecificationExecutor<User> {
    Optional<User> findByEmail(String email);

    @Query("""
            SELECT u
            FROM User u
            WHERE LOWER(u.username) LIKE LOWER(CONCAT('%', :username, '%'))
            """)
    Page<User> searchByUsername(
            @Param("username") String username,
            Pageable pageable);

}
