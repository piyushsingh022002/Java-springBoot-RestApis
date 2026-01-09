#!/bin/bash

# Script to create GitHub Issues from README Task Checklist
# This script uses GitHub CLI (gh) to create issues programmatically
# Ensure you have gh installed and authenticated before running

set -e

echo "Creating GitHub Issues for Java-springBoot-RestApis project..."
echo "============================================================="

# First, create all required labels
echo "Step 1: Creating labels..."

# Phase-specific labels
gh label create "setup" --color "0E8A16" --description "Project setup tasks" --force || true
gh label create "database" --color "1D76DB" --description "Database related tasks" --force || true
gh label create "repository" --color "5319E7" --description "Repository layer tasks" --force || true
gh label create "dto-mapper" --color "D4C5F9" --description "DTO and Mapper tasks" --force || true
gh label create "service" --color "0075CA" --description "Service layer tasks" --force || true
gh label create "controller" --color "7057FF" --description "Controller layer tasks" --force || true
gh label create "exception-handling" --color "D93F0B" --description "Exception handling tasks" --force || true
gh label create "validation" --color "FBCA04" --description "Validation tasks" --force || true
gh label create "security" --color "B60205" --description "Security related tasks" --force || true
gh label create "logging" --color "BFD4F2" --description "Logging and monitoring tasks" --force || true
gh label create "documentation" --color "0E8A16" --description "Documentation tasks" --force || true
gh label create "testing" --color "FBCA04" --description "Testing related tasks" --force || true
gh label create "performance" --color "FEF2C0" --description "Performance optimization tasks" --force || true
gh label create "production" --color "C2E0C6" --description "Production readiness tasks" --force || true
gh label create "finalization" --color "E99695" --description "Finalization tasks" --force || true

# Priority labels
gh label create "priority: critical" --color "B60205" --description "Critical priority" --force || true
gh label create "priority: high" --color "D93F0B" --description "High priority" --force || true
gh label create "priority: medium" --color "FBCA04" --description "Medium priority" --force || true
gh label create "priority: low" --color "0E8A16" --description "Low priority" --force || true

# Common labels
gh label create "spring-boot" --color "6DB33F" --description "Spring Boot related" --force || true
gh label create "poc" --color "C5DEF5" --description "Proof of Concept" --force || true

echo "Labels created successfully!"
echo ""

# Create milestones
echo "Step 2: Creating milestones..."

gh api repos/:owner/:repo/milestones -f title="Phase 1: Project Setup & Foundation" -f description="Initialize project, setup structure, and configure application" || true
gh api repos/:owner/:repo/milestones -f title="Phase 2: Database & Entity Layer" -f description="Configure database and create domain entities" || true
gh api repos/:owner/:repo/milestones -f title="Phase 3: Repository Layer" -f description="Create repositories and data access layer" || true
gh api repos/:owner/:repo/milestones -f title="Phase 4: DTO & Mapper Layer" -f description="Create DTOs and mappers" || true
gh api repos/:owner/:repo/milestones -f title="Phase 5: Service Layer" -f description="Implement business logic" || true
gh api repos/:owner/:repo/milestones -f title="Phase 6: Controller Layer" -f description="Create REST controllers and API versioning" || true
gh api repos/:owner/:repo/milestones -f title="Phase 7: Exception Handling" -f description="Global exception handling and error responses" || true
gh api repos/:owner/:repo/milestones -f title="Phase 8: Validation" -f description="Bean validation and custom validators" || true
gh api repos/:owner/:repo/milestones -f title="Phase 9: Security" -f description="Authentication, JWT, and RBAC" || true
gh api repos/:owner/:repo/milestones -f title="Phase 10: Logging & Monitoring" -f description="Logging configuration and monitoring" || true
gh api repos/:owner/:repo/milestones -f title="Phase 11: API Documentation" -f description="OpenAPI/Swagger documentation" || true
gh api repos/:owner/:repo/milestones -f title="Phase 12: Testing" -f description="Unit, integration, and security tests" || true
gh api repos/:owner/:repo/milestones -f title="Phase 13: Performance & Optimization" -f description="Caching, optimization, and async processing" || true
gh api repos/:owner/:repo/milestones -f title="Phase 14: Production Readiness" -f description="Docker, configuration, and production features" || true
gh api repos/:owner/:repo/milestones -f title="Phase 15: Documentation & Finalization" -f description="Final documentation and CI/CD" || true

echo "Milestones created successfully!"
echo ""

# Now create the issues
echo "Step 3: Creating issues..."
echo ""

# Phase 1: Project Setup & Foundation (priority: critical)

gh issue create \
  --title "Task 1.1: Initialize Spring Boot Project" \
  --label "setup,spring-boot,poc,priority: critical" \
  --milestone "Phase 1: Project Setup & Foundation" \
  --body "## Phase 1: Project Setup & Foundation

### Subtasks
- [ ] Create project using Spring Initializr
- [ ] Add dependencies:
  - Spring Web
  - Spring Data JPA
  - Spring Security
  - Spring Validation
  - PostgreSQL Driver
  - H2 Database (for dev/testing)
  - Lombok
  - Spring Boot DevTools
  - Spring Boot Actuator

### Desired Output
A runnable Spring Boot application with \`mvn spring-boot:run\` starting on port 8080."

echo "Created: Task 1.1"

gh issue create \
  --title "Task 1.2: Project Structure Setup" \
  --label "setup,spring-boot,poc,priority: critical" \
  --milestone "Phase 1: Project Setup & Foundation" \
  --body "## Phase 1: Project Setup & Foundation

### Subtasks
- [ ] Create proper package structure:
\`\`\`
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
\`\`\`

### Desired Output
Clean, organized package structure following Domain-Driven Design principles."

echo "Created: Task 1.2"

gh issue create \
  --title "Task 1.3: Application Properties Configuration" \
  --label "setup,spring-boot,poc,priority: critical" \
  --milestone "Phase 1: Project Setup & Foundation" \
  --body "## Phase 1: Project Setup & Foundation

### Subtasks
- [ ] Create \`application.yml\` with profiles (dev, prod, test)
- [ ] Configure database connections
- [ ] Set up logging levels
- [ ] Configure server settings

### Desired Output
\`\`\`yaml
# application.yml with proper profile separation
spring:
  profiles:
    active: dev
  application:
    name: springboot-poc
\`\`\`"

echo "Created: Task 1.3"

# Phase 2: Database & Entity Layer (priority: critical)

gh issue create \
  --title "Task 2.1: Database Configuration" \
  --label "database,spring-boot,poc,priority: critical" \
  --milestone "Phase 2: Database & Entity Layer" \
  --body "## Phase 2: Database & Entity Layer

### Subtasks
- [ ] Configure H2 for development
- [ ] Configure PostgreSQL for production
- [ ] Set up Flyway/Liquibase for database migrations
- [ ] Configure connection pooling (HikariCP)

### Desired Output
Database connectivity with automatic schema management and connection pooling."

echo "Created: Task 2.1"

gh issue create \
  --title "Task 2.2: Create Base Entity" \
  --label "database,spring-boot,poc,priority: critical" \
  --milestone "Phase 2: Database & Entity Layer" \
  --body "## Phase 2: Database & Entity Layer

### Subtasks
- [ ] Create \`BaseEntity\` with common audit fields:
  - \`id\` (UUID)
  - \`createdAt\`
  - \`updatedAt\`
  - \`createdBy\`
  - \`updatedBy\`
  - \`version\` (for optimistic locking)
- [ ] Implement JPA Auditing

### Desired Output
\`\`\`java
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
\`\`\`"

echo "Created: Task 2.2"

gh issue create \
  --title "Task 2.3: Create Domain Entities" \
  --label "database,spring-boot,poc,priority: critical" \
  --milestone "Phase 2: Database & Entity Layer" \
  --body "## Phase 2: Database & Entity Layer

### Subtasks
- [ ] Create \`User\` entity with proper validations
- [ ] Create \`Role\` entity for RBAC
- [ ] Create sample domain entity (e.g., \`Product\`, \`Order\`)
- [ ] Define entity relationships (OneToMany, ManyToMany)

### Desired Output
Fully mapped JPA entities with proper relationships and constraints."

echo "Created: Task 2.3"

# Phase 3: Repository Layer (priority: high)

gh issue create \
  --title "Task 3.1: Create Repositories" \
  --label "repository,spring-boot,poc,priority: high" \
  --milestone "Phase 3: Repository Layer" \
  --body "## Phase 3: Repository Layer

### Subtasks
- [ ] Create \`UserRepository\` extending \`JpaRepository\`
- [ ] Create custom query methods using \`@Query\`
- [ ] Implement pagination and sorting
- [ ] Create specifications for dynamic queries

### Desired Output
\`\`\`java
public interface UserRepository extends JpaRepository<User, UUID>, JpaSpecificationExecutor<User> {
    Optional<User> findByEmail(String email);
    
    @Query(\"SELECT u FROM User u WHERE u.status = :status\")
    Page<User> findByStatus(@Param(\"status\") Status status, Pageable pageable);
}
\`\`\`"

echo "Created: Task 3.1"

# Phase 4: DTO & Mapper Layer (priority: high)

gh issue create \
  --title "Task 4.1: Create DTOs" \
  --label "dto-mapper,spring-boot,poc,priority: high" \
  --milestone "Phase 4: DTO & Mapper Layer" \
  --body "## Phase 4: DTO & Mapper Layer

### Subtasks
- [ ] Create Request DTOs with validation annotations
- [ ] Create Response DTOs
- [ ] Create PageResponse wrapper for pagination

### Desired Output
\`\`\`java
public record UserCreateRequest(
    @NotBlank(message = \"Email is required\")
    @Email(message = \"Invalid email format\")
    String email,
    
    @NotBlank(message = \"Password is required\")
    @Size(min = 8, message = \"Password must be at least 8 characters\")
    String password,
    
    @NotBlank(message = \"Name is required\")
    String name
) {}
\`\`\`"

echo "Created: Task 4.1"

gh issue create \
  --title "Task 4.2: Create Mappers" \
  --label "dto-mapper,spring-boot,poc,priority: high" \
  --milestone "Phase 4: DTO & Mapper Layer" \
  --body "## Phase 4: DTO & Mapper Layer

### Subtasks
- [ ] Set up MapStruct configuration
- [ ] Create entity-to-DTO mappers
- [ ] Handle nested object mapping

### Desired Output
\`\`\`java
@Mapper(componentModel = \"spring\")
public interface UserMapper {
    UserResponse toResponse(User user);
    User toEntity(UserCreateRequest request);
    List<UserResponse> toResponseList(List<User> users);
}
\`\`\`"

echo "Created: Task 4.2"

# Phase 5: Service Layer (priority: high)

gh issue create \
  --title "Task 5.1: Create Service Interfaces & Implementations" \
  --label "service,spring-boot,poc,priority: high" \
  --milestone "Phase 5: Service Layer" \
  --body "## Phase 5: Service Layer

### Subtasks
- [ ] Define service interfaces
- [ ] Implement business logic
- [ ] Add transaction management (\`@Transactional\`)
- [ ] Implement caching where appropriate

### Desired Output
\`\`\`java
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
\`\`\`"

echo "Created: Task 5.1"

# Phase 6: Controller Layer (priority: high)

gh issue create \
  --title "Task 6.1: Create REST Controllers" \
  --label "controller,spring-boot,poc,priority: high" \
  --milestone "Phase 6: Controller Layer" \
  --body "## Phase 6: Controller Layer

### Subtasks
- [ ] Create controllers with proper REST conventions
- [ ] Use appropriate HTTP methods (GET, POST, PUT, PATCH, DELETE)
- [ ] Implement proper response status codes
- [ ] Add request validation with \`@Valid\`

### Desired Output
\`\`\`java
@RestController
@RequestMapping(\"/api/v1/users\")
@RequiredArgsConstructor
@Tag(name = \"User Management\")
public class UserController {
    
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<UserResponse> createUser(@Valid @RequestBody UserCreateRequest request) {
        return ApiResponse.success(userService.createUser(request));
    }
}
\`\`\`"

echo "Created: Task 6.1"

gh issue create \
  --title "Task 6.2: Implement API Versioning" \
  --label "controller,spring-boot,poc,priority: high" \
  --milestone "Phase 6: Controller Layer" \
  --body "## Phase 6: Controller Layer

### Subtasks
- [ ] Set up URL-based versioning (\`/api/v1/\`, \`/api/v2/\`)
- [ ] Document versioning strategy

### Desired Output
Versioned API endpoints with backward compatibility support."

echo "Created: Task 6.2"

# Phase 7: Exception Handling (priority: high)

gh issue create \
  --title "Task 7.1: Global Exception Handler" \
  --label "exception-handling,spring-boot,poc,priority: high" \
  --milestone "Phase 7: Exception Handling" \
  --body "## Phase 7: Exception Handling

### Subtasks
- [ ] Create \`@ControllerAdvice\` for global exception handling
- [ ] Create custom exceptions (BusinessException, ResourceNotFoundException, etc.)
- [ ] Implement standardized error response format

### Desired Output
\`\`\`java
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
\`\`\`"

echo "Created: Task 7.1"

gh issue create \
  --title "Task 7.2: Standardized API Response" \
  --label "exception-handling,spring-boot,poc,priority: high" \
  --milestone "Phase 7: Exception Handling" \
  --body "## Phase 7: Exception Handling

### Subtasks
- [ ] Create \`ApiResponse<T>\` wrapper class
- [ ] Create \`ApiError\` class with error details
- [ ] Include timestamp, trace ID, and error codes

### Desired Output
\`\`\`json
{
  \"success\": true,
  \"data\": { ... },
  \"message\": \"Operation successful\",
  \"timestamp\": \"2024-01-09T10:30:00Z\",
  \"traceId\": \"abc-123-def\"
}
\`\`\`"

echo "Created: Task 7.2"

# Phase 8: Validation (priority: medium)

gh issue create \
  --title "Task 8.1: Bean Validation" \
  --label "validation,spring-boot,poc,priority: medium" \
  --milestone "Phase 8: Validation" \
  --body "## Phase 8: Validation

### Subtasks
- [ ] Use JSR-380 annotations (\`@NotNull\`, \`@Size\`, \`@Email\`, etc.)
- [ ] Create custom validation annotations
- [ ] Implement cross-field validation

### Desired Output
\`\`\`java
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = UniqueEmailValidator.class)
public @interface UniqueEmail {
    String message() default \"Email already exists\";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
\`\`\`"

echo "Created: Task 8.1"

gh issue create \
  --title "Task 8.2: Custom Validators" \
  --label "validation,spring-boot,poc,priority: medium" \
  --milestone "Phase 8: Validation" \
  --body "## Phase 8: Validation

### Subtasks
- [ ] Create \`UniqueEmailValidator\`
- [ ] Create \`PasswordStrengthValidator\`
- [ ] Create \`PhoneNumberValidator\`

### Desired Output
Reusable custom validators with proper error messages."

echo "Created: Task 8.2"

# Phase 9: Security (priority: critical)

gh issue create \
  --title "Task 9.1: Spring Security Configuration" \
  --label "security,spring-boot,poc,priority: critical" \
  --milestone "Phase 9: Security" \
  --body "## Phase 9: Security

### Subtasks
- [ ] Configure \`SecurityFilterChain\`
- [ ] Set up password encoding (BCrypt)
- [ ] Configure CORS
- [ ] Disable CSRF for stateless API

### Desired Output
\`\`\`java
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
                .requestMatchers(\"/api/v1/auth/**\").permitAll()
                .anyRequest().authenticated()
            )
            .addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class)
            .build();
    }
}
\`\`\`"

echo "Created: Task 9.1"

gh issue create \
  --title "Task 9.2: JWT Authentication" \
  --label "security,spring-boot,poc,priority: critical" \
  --milestone "Phase 9: Security" \
  --body "## Phase 9: Security

### Subtasks
- [ ] Create JWT utility class (generate, validate, parse tokens)
- [ ] Create \`JwtAuthenticationFilter\`
- [ ] Implement refresh token mechanism
- [ ] Store tokens securely

### Desired Output
\`\`\`java
@Component
public class JwtService {
    public String generateToken(UserDetails userDetails) { ... }
    public String generateRefreshToken(UserDetails userDetails) { ... }
    public boolean isTokenValid(String token, UserDetails userDetails) { ... }
    public String extractUsername(String token) { ... }
}
\`\`\`"

echo "Created: Task 9.2"

gh issue create \
  --title "Task 9.3: Authentication Endpoints" \
  --label "security,spring-boot,poc,priority: critical" \
  --milestone "Phase 9: Security" \
  --body "## Phase 9: Security

### Subtasks
- [ ] Create \`/auth/register\` endpoint
- [ ] Create \`/auth/login\` endpoint
- [ ] Create \`/auth/refresh-token\` endpoint
- [ ] Create \`/auth/logout\` endpoint

### Desired Output
Complete authentication flow with JWT tokens."

echo "Created: Task 9.3"

gh issue create \
  --title "Task 9.4: Role-Based Access Control (RBAC)" \
  --label "security,spring-boot,poc,priority: critical" \
  --milestone "Phase 9: Security" \
  --body "## Phase 9: Security

### Subtasks
- [ ] Define roles (ADMIN, USER, MODERATOR)
- [ ] Implement \`@PreAuthorize\` annotations
- [ ] Create permission-based access control

### Desired Output
\`\`\`java
@PreAuthorize(\"hasRole('ADMIN')\")
@DeleteMapping(\"/{id}\")
public ResponseEntity<Void> deleteUser(@PathVariable UUID id) { ... }

@PreAuthorize(\"hasAuthority('user:read')\")
@GetMapping(\"/{id}\")
public ApiResponse<UserResponse> getUser(@PathVariable UUID id) { ... }
\`\`\`"

echo "Created: Task 9.4"

# Phase 10: Logging & Monitoring (priority: medium)

gh issue create \
  --title "Task 10.1: Logging Configuration" \
  --label "logging,spring-boot,poc,priority: medium" \
  --milestone "Phase 10: Logging & Monitoring" \
  --body "## Phase 10: Logging & Monitoring

### Subtasks
- [ ] Configure Logback with proper log levels
- [ ] Set up log rotation
- [ ] Add MDC for request tracing
- [ ] Create logging aspect for method entry/exit

### Desired Output
\`\`\`xml
<!-- logback-spring.xml -->
<configuration>
    <appender name=\"FILE\" class=\"ch.qos.logback.core.rolling.RollingFileAppender\">
        <rollingPolicy class=\"ch.qos.logback.core.rolling.TimeBasedRollingPolicy\">
            <fileNamePattern>logs/app-%d{yyyy-MM-dd}.log</fileNamePattern>
            <maxHistory>30</maxHistory>
        </rollingPolicy>
    </appender>
</configuration>
\`\`\`"

echo "Created: Task 10.1"

gh issue create \
  --title "Task 10.2: Request/Response Logging" \
  --label "logging,spring-boot,poc,priority: medium" \
  --milestone "Phase 10: Logging & Monitoring" \
  --body "## Phase 10: Logging & Monitoring

### Subtasks
- [ ] Create logging filter for HTTP requests
- [ ] Log request details (method, URI, headers, body)
- [ ] Log response details (status, duration)
- [ ] Mask sensitive data in logs

### Desired Output
Complete request/response logging with sensitive data masking."

echo "Created: Task 10.2"

gh issue create \
  --title "Task 10.3: Spring Boot Actuator" \
  --label "logging,spring-boot,poc,priority: medium" \
  --milestone "Phase 10: Logging & Monitoring" \
  --body "## Phase 10: Logging & Monitoring

### Subtasks
- [ ] Enable health, metrics, and info endpoints
- [ ] Secure actuator endpoints
- [ ] Add custom health indicators
- [ ] Configure Prometheus metrics export

### Desired Output
\`\`\`yaml
management:
  endpoints:
    web:
      exposure:
        include: health,info,metrics,prometheus
  endpoint:
    health:
      show-details: when_authorized
\`\`\`"

echo "Created: Task 10.3"

# Phase 11: API Documentation (priority: medium)

gh issue create \
  --title "Task 11.1: OpenAPI/Swagger Setup" \
  --label "documentation,spring-boot,poc,priority: medium" \
  --milestone "Phase 11: API Documentation" \
  --body "## Phase 11: API Documentation

### Subtasks
- [ ] Add SpringDoc OpenAPI dependency
- [ ] Configure OpenAPI info (title, version, description)
- [ ] Add JWT authentication to Swagger UI
- [ ] Document all endpoints with \`@Operation\`

### Desired Output
\`\`\`java
@Operation(
    summary = \"Create a new user\",
    description = \"Creates a new user account with the provided details\",
    responses = {
        @ApiResponse(responseCode = \"201\", description = \"User created successfully\"),
        @ApiResponse(responseCode = \"400\", description = \"Invalid input\"),
        @ApiResponse(responseCode = \"409\", description = \"Email already exists\")
    }
)
\`\`\`"

echo "Created: Task 11.1"

# Phase 12: Testing (priority: medium)

gh issue create \
  --title "Task 12.1: Unit Tests" \
  --label "testing,spring-boot,poc,priority: medium" \
  --milestone "Phase 12: Testing" \
  --body "## Phase 12: Testing

### Subtasks
- [ ] Test service layer with Mockito
- [ ] Test mappers
- [ ] Test validators
- [ ] Achieve 80%+ code coverage

### Desired Output
\`\`\`java
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
\`\`\`"

echo "Created: Task 12.1"

gh issue create \
  --title "Task 12.2: Integration Tests" \
  --label "testing,spring-boot,poc,priority: medium" \
  --milestone "Phase 12: Testing" \
  --body "## Phase 12: Testing

### Subtasks
- [ ] Test repository layer with \`@DataJpaTest\`
- [ ] Test controllers with \`@WebMvcTest\`
- [ ] Test full application with \`@SpringBootTest\`
- [ ] Use Testcontainers for database tests

### Desired Output
\`\`\`java
@SpringBootTest
@AutoConfigureMockMvc
@Testcontainers
class UserControllerIntegrationTest {
    
    @Container
    static PostgreSQLContainer<?> postgres = new PostgreSQLContainer<>(\"postgres:15\");
    
    @Autowired
    private MockMvc mockMvc;
    
    @Test
    void createUser_ShouldReturn201() throws Exception {
        mockMvc.perform(post(\"/api/v1/users\")
            .contentType(MediaType.APPLICATION_JSON)
            .content(userJson))
            .andExpect(status().isCreated());
    }
}
\`\`\`"

echo "Created: Task 12.2"

gh issue create \
  --title "Task 12.3: Security Tests" \
  --label "testing,spring-boot,poc,priority: medium" \
  --milestone "Phase 12: Testing" \
  --body "## Phase 12: Testing

### Subtasks
- [ ] Test authentication endpoints
- [ ] Test authorization rules
- [ ] Test with different roles

### Desired Output
Comprehensive security test coverage."

echo "Created: Task 12.3"

# Phase 13: Performance & Optimization (priority: low)

gh issue create \
  --title "Task 13.1: Caching" \
  --label "performance,spring-boot,poc,priority: low" \
  --milestone "Phase 13: Performance & Optimization" \
  --body "## Phase 13: Performance & Optimization

### Subtasks
- [ ] Configure Spring Cache with Redis/Caffeine
- [ ] Add \`@Cacheable\`, \`@CacheEvict\` annotations
- [ ] Implement cache TTL policies

### Desired Output
\`\`\`java
@Cacheable(value = \"users\", key = \"#id\")
public UserResponse getUserById(UUID id) { ... }

@CacheEvict(value = \"users\", key = \"#id\")
public void updateUser(UUID id, UserUpdateRequest request) { ... }
\`\`\`"

echo "Created: Task 13.1"

gh issue create \
  --title "Task 13.2: Database Optimization" \
  --label "performance,spring-boot,poc,priority: low" \
  --milestone "Phase 13: Performance & Optimization" \
  --body "## Phase 13: Performance & Optimization

### Subtasks
- [ ] Add proper indexes
- [ ] Optimize N+1 queries with \`@EntityGraph\`
- [ ] Use projections for read-only queries
- [ ] Implement batch operations

### Desired Output
Optimized database queries with proper indexing."

echo "Created: Task 13.2"

gh issue create \
  --title "Task 13.3: Async Processing" \
  --label "performance,spring-boot,poc,priority: low" \
  --milestone "Phase 13: Performance & Optimization" \
  --body "## Phase 13: Performance & Optimization

### Subtasks
- [ ] Configure \`@Async\` with custom executor
- [ ] Implement async email sending
- [ ] Add \`@Scheduled\` tasks

### Desired Output
\`\`\`java
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
\`\`\`"

echo "Created: Task 13.3"

# Phase 14: Production Readiness (priority: low)

gh issue create \
  --title "Task 14.1: Docker Configuration" \
  --label "production,spring-boot,poc,priority: low" \
  --milestone "Phase 14: Production Readiness" \
  --body "## Phase 14: Production Readiness

### Subtasks
- [ ] Create optimized \`Dockerfile\` with multi-stage build
- [ ] Create \`docker-compose.yml\` for local development
- [ ] Configure environment variables

### Desired Output
\`\`\`dockerfile
FROM eclipse-temurin:17-jdk-alpine AS builder
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT [\"java\", \"-jar\", \"app.jar\"]
\`\`\`"

echo "Created: Task 14.1"

gh issue create \
  --title "Task 14.2: Environment Configuration" \
  --label "production,spring-boot,poc,priority: low" \
  --milestone "Phase 14: Production Readiness" \
  --body "## Phase 14: Production Readiness

### Subtasks
- [ ] Externalize all configurations
- [ ] Use environment variables for secrets
- [ ] Configure different profiles (dev, staging, prod)

### Desired Output
Fully externalized configuration with no hardcoded secrets."

echo "Created: Task 14.2"

gh issue create \
  --title "Task 14.3: Health Checks & Graceful Shutdown" \
  --label "production,spring-boot,poc,priority: low" \
  --milestone "Phase 14: Production Readiness" \
  --body "## Phase 14: Production Readiness

### Subtasks
- [ ] Configure graceful shutdown
- [ ] Add readiness and liveness probes
- [ ] Implement circuit breaker pattern (Resilience4j)

### Desired Output
\`\`\`yaml
server:
  shutdown: graceful
spring:
  lifecycle:
    timeout-per-shutdown-phase: 30s
\`\`\`"

echo "Created: Task 14.3"

gh issue create \
  --title "Task 14.4: Rate Limiting" \
  --label "production,spring-boot,poc,priority: low" \
  --milestone "Phase 14: Production Readiness" \
  --body "## Phase 14: Production Readiness

### Subtasks
- [ ] Implement rate limiting with Bucket4j
- [ ] Configure per-user and per-IP limits
- [ ] Add rate limit headers in response

### Desired Output
API rate limiting to prevent abuse."

echo "Created: Task 14.4"

# Phase 15: Documentation & Finalization (priority: low)

gh issue create \
  --title "Task 15.1: README Documentation" \
  --label "finalization,spring-boot,poc,priority: low" \
  --milestone "Phase 15: Documentation & Finalization" \
  --body "## Phase 15: Documentation & Finalization

### Subtasks
- [ ] Add project description
- [ ] Document setup instructions
- [ ] Add API documentation links
- [ ] Include architecture diagrams

### Desired Output
Comprehensive README documentation."

echo "Created: Task 15.1"

gh issue create \
  --title "Task 15.2: Code Quality" \
  --label "finalization,spring-boot,poc,priority: low" \
  --milestone "Phase 15: Documentation & Finalization" \
  --body "## Phase 15: Documentation & Finalization

### Subtasks
- [ ] Add Checkstyle configuration
- [ ] Configure SpotBugs/SonarQube
- [ ] Add pre-commit hooks
- [ ] Ensure consistent code formatting

### Desired Output
Code quality tools configured and enforced."

echo "Created: Task 15.2"

gh issue create \
  --title "Task 15.3: CI/CD Pipeline" \
  --label "finalization,spring-boot,poc,priority: low" \
  --milestone "Phase 15: Documentation & Finalization" \
  --body "## Phase 15: Documentation & Finalization

### Subtasks
- [ ] Create GitHub Actions workflow
- [ ] Add build and test stages
- [ ] Add Docker image build and push
- [ ] Configure deployment stages

### Desired Output
\`\`\`yaml
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
\`\`\`"

echo "Created: Task 15.3"

echo ""
echo "============================================================="
echo "All 45 issues created successfully!"
echo "Visit your repository's issues page to see them."
echo "============================================================="
