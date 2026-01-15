package com.RESTapis.javaBackend.service;

import java.util.List;
import java.util.UUID;

import com.RESTapis.javaBackend.dto.UserCreateRequest;
import com.RESTapis.javaBackend.dto.UserResponse;

public interface UserService {
    // create a new user
    UserResponse createUser(UserCreateRequest request);

    // Fetch a user by id
    UserResponse getUserById(UUID id);

    // Fetch all users
    List<UserResponse> getAllUsers();

}
