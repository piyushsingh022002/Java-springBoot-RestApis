package com.RESTapis.javaBackend.service.impl;

import com.RESTapis.javaBackend.dto.UserCreateRequest;
import com.RESTapis.javaBackend.dto.UserResponse;
import com.RESTapis.javaBackend.entity.Status;
import com.RESTapis.javaBackend.entity.User;
import com.RESTapis.javaBackend.mapper.UserMapper;
import com.RESTapis.javaBackend.repository.UserRepository;
import com.RESTapis.javaBackend.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final UserMapper userMapper;

    @Override
    @Transactional
    public UserResponse createUser(UserCreateRequest request) {
        // Business validation: check if username/email already exist
        userRepository.findByUsername(request.username())
                .ifPresent(u -> {
                    throw new IllegalArgumentException("Username already exists");
                });

        userRepository.findByEmail(request.email())
                .ifPresent(u -> {
                    throw new IllegalArgumentException("Email already exists");
                });

        // Map DTO to entity
        User user = userMapper.toEntity(request);

        // Set default status
        user.setStatus(Status.ACTIVE);

        // Save entity
        User savedUser = userRepository.save(user);

        // Map to response DTO
        return userMapper.toResponse(savedUser);
    }

    @Override
    public UserResponse getUserById(UUID id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("User not found"));

        return userMapper.toResponse(user);
    }

    @Override
    public List<UserResponse> getAllUsers() {
        List<User> users = userRepository.findAll();
        return userMapper.toResponseList(users);
    }

}
