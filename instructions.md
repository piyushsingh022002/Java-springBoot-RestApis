## Prompt

```
Read the README.md file in this repository and create GitHub Issues for each task listed in the "Task Checklist" section.

For each task, create an issue with:

1. **Title**: Use the task name (e.g., "Task 1.1: Initialize Spring Boot Project")

2. **Description**: Include:
   - All subtasks as a checklist
   - The "Desired Output" section if present
   - Reference to the parent Phase

3. **Labels**: Apply the following labels based on the task:
   - `setup` - for Phase 1 tasks
   - `database` - for Phase 2 tasks
   - `repository` - for Phase 3 tasks
   - `dto-mapper` - for Phase 4 tasks
   - `service` - for Phase 5 tasks
   - `controller` - for Phase 6 tasks
   - `exception-handling` - for Phase 7 tasks
   - `validation` - for Phase 8 tasks
   - `security` - for Phase 9 tasks
   - `logging` - for Phase 10 tasks
   - `documentation` - for Phase 11 tasks
   - `testing` - for Phase 12 tasks
   - `performance` - for Phase 13 tasks
   - `production` - for Phase 14 tasks
   - `finalization` - for Phase 15 tasks
   - `spring-boot` - for all tasks
   - `poc` - for all tasks

4. **Priority Labels**:
   - `priority: critical` - Phase 1, 2, 9 (Setup, Database, Security)
   - `priority: high` - Phase 3, 4, 5, 6, 7 (Core application layers)
   - `priority: medium` - Phase 8, 10, 11, 12 (Validation, Logging, Docs, Testing)
   - `priority: low` - Phase 13, 14, 15 (Optimization, Production, Finalization)

5. **Milestone**: Group by Phase name (e.g., "Phase 1: Project Setup & Foundation")

6. **Assignee**: Leave unassigned

Create all issues in sequential order starting from Task 1.1 through Task 15.3.
```

---

## Alternative: GitHub CLI Command

If you prefer using GitHub CLI, run this after creating the labels:

```bash
# First, create the required labels
gh label create "setup" --color "0E8A16" --description "Project setup tasks"
gh label create "database" --color "1D76DB" --description "Database related tasks"
gh label create "security" --color "B60205" --description "Security related tasks"
gh label create "testing" --color "FBCA04" --description "Testing related tasks"
gh label create "priority: critical" --color "B60205"
gh label create "priority: high" --color "D93F0B"
gh label create "priority: medium" --color "FBCA04"
gh label create "priority: low" --color "0E8A16"
gh label create "spring-boot" --color "6DB33F"
gh label create "poc" --color "C5DEF5"

# Then use Copilot to generate issue creation commands
```

---

## Expected Output

GitHub Issues will be created with structure like:

**Issue Title:** `Task 1.1: Initialize Spring Boot Project`

**Labels:** `setup`, `spring-boot`, `poc`, `priority: critical`

**Body:**
```markdown
## Phase 1: Project Setup & Foundation

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
A runnable Spring Boot application with `mvn spring-boot:run` starting on port 8080.
```

---

## Notes

- Ensure labels exist before running the prompt
- Review generated issues before bulk creation
- Adjust priorities based on your project needs
