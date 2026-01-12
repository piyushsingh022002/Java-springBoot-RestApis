# Java Spring Boot - Production-Ready Backend Application

> A comprehensive Proof of Concept showcasing a fully-fledged, secure, clean, and production-level Java Spring Boot backend application.

---

## Project Overview

**Goal:** Build a complete REST API backend demonstrating Spring Boot best practices including security, validation, error handling, logging, testing, and production-ready configurations.

**Tech Stack:**
- Java 17+
- Spring Boot 3.x
- Spring Security with JWT
- Spring Data JPA
- PostgreSQL / H2 (dev)
- Maven
- Lombok
- MapStruct
- OpenAPI/Swagger
- Docker

---

## Task Checklist

### Phase 1: Project Setup & Foundation

#### Task 1.1: Initialize Spring Boot Project
- [ ✔ ] Create project using Spring Initializr
- [ ✔ ] **Dependencies to include:**
  - Spring Web
  - Spring Data JPA
  - Spring Security
  - Spring Validation
  - PostgreSQL Driver
  - H2 Database (for dev/testing)
  - Lombok
  - Spring Boot DevTools
  - Spring Boot Actuator

**Desired Output:** A runnable Spring Boot application with `mvn spring-boot:run` starting on port 8080.

---

#### Task 1.2: Project Structure Setup
- [ ✔ ] Create proper package structure:
```
src/main/java/com/example/app/
├── config/          # Configuration classes
├── controller/      # REST Controllers
├── service/         # Business logic
├── repository/      # Data access layer
├── entity/          # JPA Entities
├── dto/             # Data Transfer Objects
├── mapper/          # DTO-Entity mappers
├── exception/       # Custom exceptions
├── security/        # Security configurations
├── util/            # Utility classes
└── validation/      # Custom validators
```

**Desired Output:** Clean, organized package structure following Domain-Driven Design principles.

---

#### Task 1.3: Application Properties Configuration
- [ ✔] Create `application.yml` with profiles (dev, prod, test)
- [ ✔] Configure database connections
- [ ✔] Set up logging levels
- [ ✔] Configure server settings

**Desired Output:**
```yaml
# application.yml with proper profile separation
spring:
  profiles:
    active: dev
  application:
    name: springboot-poc
```

---

### Phase 2: Database & Entity Layer

#### Task 2.1: Database Configuration
- [ ] Configure H2 for development
- [ ] Configure PostgreSQL for production
- [ ] Set up Flyway/Liquibase for database migrations
- [ ] Configure connection pooling (HikariCP)

**Desired Output:** Database connectivity with automatic schema management and connection pooling.

---

#### Task 2.2: Create Base Entity
- [ ] Create `BaseEntity` with common audit fields:
  - `id` (UUID)
  - `createdAt`
  - `updatedAt`
  - `createdBy`
  - `updatedBy`
  - `version` (for optimistic locking)
- [ ] Implement JPA Auditing

**Desired Output:**
```java
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public abstract class BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    
    @CreatedDate
    private LocalDateTime createdAt;
    
    @LastModifiedDate
    private LocalDateTime updatedAt;
    
    @Version
    private Long version;
}
```

---

#### Task 2.3: Create Domain Entities
- [ ] Create `User` entity with proper validations
- [ ] Create `Role` entity for RBAC
- [ ] Create sample domain entity (e.g., `Product`, `Order`)
- [ ] Define entity relationships (OneToMany, ManyToMany)

**Desired Output:** Fully mapped JPA entities with proper relationships and constraints.

---

### Phase 3: Repository Layer

#### Task 3.1: Create Repositories
- [ ] Create `UserRepository` extending `JpaRepository`
- [ ] Create custom query methods using `@Query`
- [ ] Implement pagination and sorting
- [ ] Create specifications for dynamic queries

**Desired Output:**
```java
public interface UserRepository extends JpaRepository<User, UUID>, JpaSpecificationExecutor<User> {
    Optional<User> findByEmail(String email);
    
    @Query("SELECT u FROM User u WHERE u.status = :status")
    Page<User> findByStatus(@Param("status") Status status, Pageable pageable);
}
```

---

### Phase 4: DTO & Mapper Layer

#### Task 4.1: Create DTOs
- [ ] Create Request DTOs with validation annotations
- [ ] Create Response DTOs
- [ ] Create PageResponse wrapper for pagination

**Desired Output:**
```java
public record UserCreateRequest(
    @NotBlank(message = "Email is required")
    @Email(message = "Invalid email format")
    String email,
    
    @NotBlank(message = "Password is required")
    @Size(min = 8, message = "Password must be at least 8 characters")
    String password,
    
    @NotBlank(message = "Name is required")
    String name
) {}
```

---

#### Task 4.2: Create Mappers
- [ ] Set up MapStruct configuration
- [ ] Create entity-to-DTO mappers
- [ ] Handle nested object mapping

**Desired Output:**
```java
@Mapper(componentModel = "spring")
public interface UserMapper {
    UserResponse toResponse(User user);
    User toEntity(UserCreateRequest request);
    List<UserResponse> toResponseList(List<User> users);
}
```

---

### Phase 5: Service Layer

#### Task 5.1: Create Service Interfaces & Implementations
- [ ] Define service interfaces
- [ ] Implement business logic
- [ ] Add transaction management (`@Transactional`)
- [ ] Implement caching where appropriate

**Desired Output:**
```java
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService {
    
    private final UserRepository userRepository;
    private final UserMapper userMapper;
    
    @Override
    @Transactional
    public UserResponse createUser(UserCreateRequest request) {
        // Business logic with proper validation
    }
}
```

---

### Phase 6: Controller Layer

#### Task 6.1: Create REST Controllers
- [ ] Create controllers with proper REST conventions
- [ ] Use appropriate HTTP methods (GET, POST, PUT, PATCH, DELETE)
- [ ] Implement proper response status codes
- [ ] Add request validation with `@Valid`

**Desired Output:**
```java
@RestController
@RequestMapping("/api/v1/users")
@RequiredArgsConstructor
@Tag(name = "User Management")
public class UserController {
    
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<UserResponse> createUser(@Valid @RequestBody UserCreateRequest request) {
        return ApiResponse.success(userService.createUser(request));
    }
}
```

---

#### Task 6.2: Implement API Versioning
- [ ] Set up URL-based versioning (`/api/v1/`, `/api/v2/`)
- [ ] Document versioning strategy

**Desired Output:** Versioned API endpoints with backward compatibility support.

---

### Phase 7: Exception Handling

#### Task 7.1: Global Exception Handler
- [ ] Create `@ControllerAdvice` for global exception handling
- [ ] Create custom exceptions (BusinessException, ResourceNotFoundException, etc.)
- [ ] Implement standardized error response format

**Desired Output:**
```java
@RestControllerAdvice
public class GlobalExceptionHandler {
    
    @ExceptionHandler(ResourceNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public ApiError handleNotFound(ResourceNotFoundException ex) {
        return ApiError.of(HttpStatus.NOT_FOUND, ex.getMessage());
    }
    
    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ApiError handleValidation(MethodArgumentNotValidException ex) {
        // Return field-level validation errors
    }
}
```

---

#### Task 7.2: Standardized API Response
- [ ] Create `ApiResponse<T>` wrapper class
- [ ] Create `ApiError` class with error details
- [ ] Include timestamp, trace ID, and error codes

**Desired Output:**
```json
{
  "success": true,
  "data": { ... },
  "message": "Operation successful",
  "timestamp": "2024-01-09T10:30:00Z",
  "traceId": "abc-123-def"
}
```

---

### Phase 8: Validation

#### Task 8.1: Bean Validation
- [ ] Use JSR-380 annotations (`@NotNull`, `@Size`, `@Email`, etc.)
- [ ] Create custom validation annotations
- [ ] Implement cross-field validation

**Desired Output:**
```java
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = UniqueEmailValidator.class)
public @interface UniqueEmail {
    String message() default "Email already exists";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
```

---

#### Task 8.2: Custom Validators
- [ ] Create `UniqueEmailValidator`
- [ ] Create `PasswordStrengthValidator`
- [ ] Create `PhoneNumberValidator`

**Desired Output:** Reusable custom validators with proper error messages.

---

### Phase 9: Security

#### Task 9.1: Spring Security Configuration
- [ ] Configure `SecurityFilterChain`
- [ ] Set up password encoding (BCrypt)
- [ ] Configure CORS
- [ ] Disable CSRF for stateless API

**Desired Output:**
```java
@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {
    
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        return http
            .csrf(AbstractHttpConfigurer::disable)
            .cors(cors -> cors.configurationSource(corsConfigurationSource()))
            .sessionManagement(session -> session.sessionCreationPolicy(STATELESS))
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/api/v1/auth/**").permitAll()
                .anyRequest().authenticated()
            )
            .addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class)
            .build();
    }
}
```

---

#### Task 9.2: JWT Authentication
- [ ] Create JWT utility class (generate, validate, parse tokens)
- [ ] Create `JwtAuthenticationFilter`
- [ ] Implement refresh token mechanism
- [ ] Store tokens securely

**Desired Output:**
```java
@Component
public class JwtService {
    public String generateToken(UserDetails userDetails) { ... }
    public String generateRefreshToken(UserDetails userDetails) { ... }
    public boolean isTokenValid(String token, UserDetails userDetails) { ... }
    public String extractUsername(String token) { ... }
}
```

---

#### Task 9.3: Authentication Endpoints
- [ ] Create `/auth/register` endpoint
- [ ] Create `/auth/login` endpoint
- [ ] Create `/auth/refresh-token` endpoint
- [ ] Create `/auth/logout` endpoint

**Desired Output:** Complete authentication flow with JWT tokens.

---

#### Task 9.4: Role-Based Access Control (RBAC)
- [ ] Define roles (ADMIN, USER, MODERATOR)
- [ ] Implement `@PreAuthorize` annotations
- [ ] Create permission-based access control

**Desired Output:**
```java
@PreAuthorize("hasRole('ADMIN')")
@DeleteMapping("/{id}")
public ResponseEntity<Void> deleteUser(@PathVariable UUID id) { ... }

@PreAuthorize("hasAuthority('user:read')")
@GetMapping("/{id}")
public ApiResponse<UserResponse> getUser(@PathVariable UUID id) { ... }
```

---

### Phase 10: Logging & Monitoring

#### Task 10.1: Logging Configuration
- [ ] Configure Logback with proper log levels
- [ ] Set up log rotation
- [ ] Add MDC for request tracing
- [ ] Create logging aspect for method entry/exit

**Desired Output:**
```xml
<!-- logback-spring.xml -->
<configuration>
    <appender name="FILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <fileNamePattern>logs/app-%d{yyyy-MM-dd}.log</fileNamePattern>
            <maxHistory>30</maxHistory>
        </rollingPolicy>
    </appender>
</configuration>
```

---

#### Task 10.2: Request/Response Logging
- [ ] Create logging filter for HTTP requests
- [ ] Log request details (method, URI, headers, body)
- [ ] Log response details (status, duration)
- [ ] Mask sensitive data in logs

**Desired Output:** Complete request/response logging with sensitive data masking.

---

#### Task 10.3: Spring Boot Actuator
- [ ] Enable health, metrics, and info endpoints
- [ ] Secure actuator endpoints
- [ ] Add custom health indicators
- [ ] Configure Prometheus metrics export

**Desired Output:**
```yaml
management:
  endpoints:
    web:
      exposure:
        include: health,info,metrics,prometheus
  endpoint:
    health:
      show-details: when_authorized
```

---

### Phase 11: API Documentation

#### Task 11.1: OpenAPI/Swagger Setup
- [ ] Add SpringDoc OpenAPI dependency
- [ ] Configure OpenAPI info (title, version, description)
- [ ] Add JWT authentication to Swagger UI
- [ ] Document all endpoints with `@Operation`

**Desired Output:**
```java
@Operation(
    summary = "Create a new user",
    description = "Creates a new user account with the provided details",
    responses = {
        @ApiResponse(responseCode = "201", description = "User created successfully"),
        @ApiResponse(responseCode = "400", description = "Invalid input"),
        @ApiResponse(responseCode = "409", description = "Email already exists")
    }
)
```

---

### Phase 12: Testing

#### Task 12.1: Unit Tests
- [ ] Test service layer with Mockito
- [ ] Test mappers
- [ ] Test validators
- [ ] Achieve 80%+ code coverage

**Desired Output:**
```java
@ExtendWith(MockitoExtension.class)
class UserServiceTest {
    
    @Mock
    private UserRepository userRepository;
    
    @InjectMocks
    private UserServiceImpl userService;
    
    @Test
    void createUser_WithValidData_ShouldReturnUser() {
        // Given, When, Then
    }
}
```

---

#### Task 12.2: Integration Tests
- [ ] Test repository layer with `@DataJpaTest`
- [ ] Test controllers with `@WebMvcTest`
- [ ] Test full application with `@SpringBootTest`
- [ ] Use Testcontainers for database tests

**Desired Output:**
```java
@SpringBootTest
@AutoConfigureMockMvc
@Testcontainers
class UserControllerIntegrationTest {
    
    @Container
    static PostgreSQLContainer<?> postgres = new PostgreSQLContainer<>("postgres:15");
    
    @Autowired
    private MockMvc mockMvc;
    
    @Test
    void createUser_ShouldReturn201() throws Exception {
        mockMvc.perform(post("/api/v1/users")
            .contentType(MediaType.APPLICATION_JSON)
            .content(userJson))
            .andExpect(status().isCreated());
    }
}
```

---

#### Task 12.3: Security Tests
- [ ] Test authentication endpoints
- [ ] Test authorization rules
- [ ] Test with different roles

**Desired Output:** Comprehensive security test coverage.

---

### Phase 13: Performance & Optimization

#### Task 13.1: Caching
- [ ] Configure Spring Cache with Redis/Caffeine
- [ ] Add `@Cacheable`, `@CacheEvict` annotations
- [ ] Implement cache TTL policies

**Desired Output:**
```java
@Cacheable(value = "users", key = "#id")
public UserResponse getUserById(UUID id) { ... }

@CacheEvict(value = "users", key = "#id")
public void updateUser(UUID id, UserUpdateRequest request) { ... }
```

---

#### Task 13.2: Database Optimization
- [ ] Add proper indexes
- [ ] Optimize N+1 queries with `@EntityGraph`
- [ ] Use projections for read-only queries
- [ ] Implement batch operations

**Desired Output:** Optimized database queries with proper indexing.

---

#### Task 13.3: Async Processing
- [ ] Configure `@Async` with custom executor
- [ ] Implement async email sending
- [ ] Add `@Scheduled` tasks

**Desired Output:**
```java
@Configuration
@EnableAsync
public class AsyncConfig {
    @Bean
    public Executor taskExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(5);
        executor.setMaxPoolSize(10);
        executor.setQueueCapacity(25);
        return executor;
    }
}
```

---

### Phase 14: Production Readiness

#### Task 14.1: Docker Configuration
- [ ] Create optimized `Dockerfile` with multi-stage build
- [ ] Create `docker-compose.yml` for local development
- [ ] Configure environment variables

**Desired Output:**
```dockerfile
FROM eclipse-temurin:17-jdk-alpine AS builder
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
```

---

#### Task 14.2: Environment Configuration
- [ ] Externalize all configurations
- [ ] Use environment variables for secrets
- [ ] Configure different profiles (dev, staging, prod)

**Desired Output:** Fully externalized configuration with no hardcoded secrets.

---

#### Task 14.3: Health Checks & Graceful Shutdown
- [ ] Configure graceful shutdown
- [ ] Add readiness and liveness probes
- [ ] Implement circuit breaker pattern (Resilience4j)

**Desired Output:**
```yaml
server:
  shutdown: graceful
spring:
  lifecycle:
    timeout-per-shutdown-phase: 30s
```

---

#### Task 14.4: Rate Limiting
- [ ] Implement rate limiting with Bucket4j
- [ ] Configure per-user and per-IP limits
- [ ] Add rate limit headers in response

**Desired Output:** API rate limiting to prevent abuse.

---

### Phase 15: Documentation & Finalization

#### Task 15.1: README Documentation
- [ ] Add project description
- [ ] Document setup instructions
- [ ] Add API documentation links
- [ ] Include architecture diagrams

---

#### Task 15.2: Code Quality
- [ ] Add Checkstyle configuration
- [ ] Configure SpotBugs/SonarQube
- [ ] Add pre-commit hooks
- [ ] Ensure consistent code formatting

---

#### Task 15.3: CI/CD Pipeline
- [ ] Create GitHub Actions workflow
- [ ] Add build and test stages
- [ ] Add Docker image build and push
- [ ] Configure deployment stages

**Desired Output:**
```yaml
# .github/workflows/ci.yml
name: CI/CD Pipeline
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Set up JDK 17
        uses: actions/setup-java@v4
      - name: Build with Maven
        run: mvn clean verify
```

---

## Quick Start Commands

```bash
# Run locally
./mvnw spring-boot:run

# Run tests
./mvnw test

# Build JAR
./mvnw clean package

# Run with Docker
docker-compose up -d

# Access Swagger UI
http://localhost:8080/swagger-ui.html

# Access Actuator
http://localhost:8080/actuator/health
```

---

## API Endpoints Summary

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/v1/auth/register` | Register new user | No |
| POST | `/api/v1/auth/login` | User login | No |
| POST | `/api/v1/auth/refresh` | Refresh token | No |
| GET | `/api/v1/users` | Get all users | Yes (ADMIN) |
| GET | `/api/v1/users/{id}` | Get user by ID | Yes |
| PUT | `/api/v1/users/{id}` | Update user | Yes |
| DELETE | `/api/v1/users/{id}` | Delete user | Yes (ADMIN) |

---

## Success Criteria

- [ ] Application starts without errors
- [ ] All endpoints return proper responses
- [ ] Authentication & authorization working
- [ ] Validation errors return proper messages
- [ ] 80%+ test coverage
- [ ] API documentation accessible
- [ ] Docker image builds successfully
- [ ] Health checks passing
- [ ] Logs properly formatted and rotated

---

## Notes

- Follow SOLID principles throughout
- Use constructor injection over field injection
- Keep controllers thin, services fat
- Always validate input at controller level
- Use DTOs for API communication, never expose entities
- Handle all exceptions gracefully
- Log at appropriate levels (ERROR, WARN, INFO, DEBUG)

---

**Author:** [Your Name]  
**Created:** January 2026  
**Last Updated:** January 2026
