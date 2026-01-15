package com.RESTapis.javaBackend.mapper;

import com.RESTapis.javaBackend.dto.UserCreateRequest;
import com.RESTapis.javaBackend.dto.UserResponse;
import com.RESTapis.javaBackend.entity.User;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface UserMapper {

    // Entity -> responseDto
    UserResponse toResponse(User user);

    // createRequest Dto -> Entity
    User toEntity(UserCreateRequest request);

    // List<Entity> -> List<DTO>
    List<UserResponse> toResponseList(List<User> users);

}
