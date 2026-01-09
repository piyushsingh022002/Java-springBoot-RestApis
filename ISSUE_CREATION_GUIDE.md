# GitHub Issues Creation Guide

This guide explains how to create all GitHub Issues for the Java Spring Boot REST APIs project based on the task checklist in README.md.

## Overview

The `create-issues.sh` script will automatically create:
- **45 GitHub Issues** (Tasks 1.1 through 15.3)
- **15 Milestones** (One for each phase)
- **17 Labels** (Phase-specific, priority, and common labels)

## Prerequisites

Before running the script, ensure you have:

1. **GitHub CLI (`gh`) installed**
   ```bash
   # On macOS
   brew install gh
   
   # On Ubuntu/Debian
   sudo apt install gh
   
   # On Windows (using winget)
   winget install --id GitHub.cli
   ```

2. **GitHub CLI authenticated**
   ```bash
   gh auth login
   ```
   Follow the prompts to authenticate with your GitHub account.

3. **Correct repository context**
   Navigate to your repository directory:
   ```bash
   cd /path/to/Java-springBoot-RestApis
   ```

## How to Use

### Method 1: Run the Script (Recommended)

1. Make the script executable (if not already):
   ```bash
   chmod +x create-issues.sh
   ```

2. Run the script:
   ```bash
   ./create-issues.sh
   ```

3. The script will:
   - Create all required labels
   - Create 15 milestones for each phase
   - Create 45 issues with proper labels, milestones, and descriptions
   - Display progress as it creates each issue

### Method 2: Manual Label Creation First

If you want to create labels separately before creating issues:

```bash
# Create phase-specific labels
gh label create "setup" --color "0E8A16" --description "Project setup tasks"
gh label create "database" --color "1D76DB" --description "Database related tasks"
gh label create "repository" --color "5319E7" --description "Repository layer tasks"
gh label create "dto-mapper" --color "D4C5F9" --description "DTO and Mapper tasks"
gh label create "service" --color "0075CA" --description "Service layer tasks"
gh label create "controller" --color "7057FF" --description "Controller layer tasks"
gh label create "exception-handling" --color "D93F0B" --description "Exception handling tasks"
gh label create "validation" --color "FBCA04" --description "Validation tasks"
gh label create "security" --color "B60205" --description "Security related tasks"
gh label create "logging" --color "BFD4F2" --description "Logging and monitoring tasks"
gh label create "documentation" --color "0E8A16" --description "Documentation tasks"
gh label create "testing" --color "FBCA04" --description "Testing related tasks"
gh label create "performance" --color "FEF2C0" --description "Performance optimization tasks"
gh label create "production" --color "C2E0C6" --description "Production readiness tasks"
gh label create "finalization" --color "E99695" --description "Finalization tasks"

# Create priority labels
gh label create "priority: critical" --color "B60205" --description "Critical priority"
gh label create "priority: high" --color "D93F0B" --description "High priority"
gh label create "priority: medium" --color "FBCA04" --description "Medium priority"
gh label create "priority: low" --color "0E8A16" --description "Low priority"

# Create common labels
gh label create "spring-boot" --color "6DB33F" --description "Spring Boot related"
gh label create "poc" --color "C5DEF5" --description "Proof of Concept"
```

## What Gets Created

### Labels (17 total)

**Phase-Specific Labels:**
- `setup` - Project setup tasks
- `database` - Database related tasks
- `repository` - Repository layer tasks
- `dto-mapper` - DTO and Mapper tasks
- `service` - Service layer tasks
- `controller` - Controller layer tasks
- `exception-handling` - Exception handling tasks
- `validation` - Validation tasks
- `security` - Security related tasks
- `logging` - Logging and monitoring tasks
- `documentation` - Documentation tasks
- `testing` - Testing related tasks
- `performance` - Performance optimization tasks
- `production` - Production readiness tasks
- `finalization` - Finalization tasks

**Priority Labels:**
- `priority: critical` - For Phases 1, 2, 9 (Setup, Database, Security)
- `priority: high` - For Phases 3-7 (Core application layers)
- `priority: medium` - For Phases 8, 10-12 (Validation, Logging, Docs, Testing)
- `priority: low` - For Phases 13-15 (Optimization, Production, Finalization)

**Common Labels:**
- `spring-boot` - Applied to all tasks
- `poc` - Applied to all tasks

### Milestones (15 total)

1. Phase 1: Project Setup & Foundation
2. Phase 2: Database & Entity Layer
3. Phase 3: Repository Layer
4. Phase 4: DTO & Mapper Layer
5. Phase 5: Service Layer
6. Phase 6: Controller Layer
7. Phase 7: Exception Handling
8. Phase 8: Validation
9. Phase 9: Security
10. Phase 10: Logging & Monitoring
11. Phase 11: API Documentation
12. Phase 12: Testing
13. Phase 13: Performance & Optimization
14. Phase 14: Production Readiness
15. Phase 15: Documentation & Finalization

### Issues (45 total)

Each issue includes:
- **Title**: Task number and name (e.g., "Task 1.1: Initialize Spring Boot Project")
- **Labels**: Phase label + `spring-boot` + `poc` + appropriate priority
- **Milestone**: Assigned to the corresponding phase
- **Body**: 
  - Phase reference
  - Subtasks as checkboxes
  - Desired output section (where applicable)

## Issue Organization

Issues are organized by priority:

**Priority: Critical (10 issues)**
- Phase 1: Tasks 1.1, 1.2, 1.3 (Setup)
- Phase 2: Tasks 2.1, 2.2, 2.3 (Database)
- Phase 9: Tasks 9.1, 9.2, 9.3, 9.4 (Security)

**Priority: High (9 issues)**
- Phase 3: Task 3.1 (Repository)
- Phase 4: Tasks 4.1, 4.2 (DTO/Mapper)
- Phase 5: Task 5.1 (Service)
- Phase 6: Tasks 6.1, 6.2 (Controller)
- Phase 7: Tasks 7.1, 7.2 (Exception Handling)

**Priority: Medium (10 issues)**
- Phase 8: Tasks 8.1, 8.2 (Validation)
- Phase 10: Tasks 10.1, 10.2, 10.3 (Logging)
- Phase 11: Task 11.1 (Documentation)
- Phase 12: Tasks 12.1, 12.2, 12.3 (Testing)

**Priority: Low (16 issues)**
- Phase 13: Tasks 13.1, 13.2, 13.3 (Performance)
- Phase 14: Tasks 14.1, 14.2, 14.3, 14.4 (Production)
- Phase 15: Tasks 15.1, 15.2, 15.3 (Finalization)

## Verification

After running the script, verify the issues were created:

```bash
# List all issues
gh issue list --limit 50

# List issues by milestone
gh issue list --milestone "Phase 1: Project Setup & Foundation"

# List issues by label
gh issue list --label "priority: critical"

# List all labels
gh label list

# List all milestones
gh api repos/:owner/:repo/milestones
```

## Troubleshooting

### Error: "Label not found"
If you get label errors, the `--force` flag in the script should handle this. If issues persist, manually create labels first using Method 2 above.

### Error: "Milestone not found"
The script creates milestones using the GitHub API. If you encounter errors:
```bash
# List existing milestones
gh api repos/:owner/:repo/milestones

# Manually create a milestone if needed
gh api repos/:owner/:repo/milestones -f title="Phase 1: Project Setup & Foundation"
```

### Error: "Not authenticated"
Run:
```bash
gh auth login
```
and follow the prompts.

### Error: "Repository not found"
Ensure you're in the correct repository directory or specify the repository:
```bash
gh issue create --repo piyushsingh022002/Java-springBoot-RestApis ...
```

## Customization

To customize the script:

1. **Change label colors**: Edit the `--color` values in the label creation section
2. **Modify priorities**: Adjust the priority labels assigned to each issue
3. **Update descriptions**: Edit the issue body content in the script
4. **Add/remove labels**: Modify the `--label` parameter for each issue

## Next Steps

After creating the issues:

1. Review all created issues in your GitHub repository
2. Assign issues to team members as needed
3. Adjust priorities or milestones if necessary
4. Start working on Phase 1 tasks first (critical priority)
5. Use the issues to track progress through the project

## Support

If you encounter any issues or need help:
1. Check the [GitHub CLI documentation](https://cli.github.com/manual/)
2. Review the error messages carefully
3. Ensure you have proper repository permissions
4. Verify your GitHub authentication status

---

**Note**: This script uses the `--force` flag for label creation to avoid errors if labels already exist. Existing labels will not be modified.
