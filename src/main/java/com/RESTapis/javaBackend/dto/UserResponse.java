package com.RESTapis.javaBackend.dto;

import java.time.LocalDateTime;
import java.util.UUID;

import ch.qos.logback.core.status.Status;

public record UserResponse(
        UUID id,
        String username,
        String email,
        Status status,
        LocalDateTime createdAt) {

}
