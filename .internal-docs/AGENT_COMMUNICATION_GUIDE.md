# Cursor AI Agent Communication & Switching Guide

## Table of Contents
1. [Understanding Cursor Agents](#understanding-cursor-agents)
2. [Agent Communication Patterns](#agent-communication-patterns)
3. [Switching Between Agents](#switching-between-agents)
4. [Model Selection & Control](#model-selection--control)
5. [Practical Examples](#practical-examples)
6. [Best Practices](#best-practices)
7. [Troubleshooting](#troubleshooting)

## Understanding Cursor Agents

### What is a Cursor Agent?
Based on current research (2025), a Cursor AI agent is defined as:
- **LLM + Tools + Loop**: A language model with access to tools that can iterate through multiple steps
- **Instructions**: System prompts that define the agent's role and behavior
- **Model**: The specific AI model being used (Claude, GPT-4, Gemini, etc.)
- **Tools**: Functions the agent can call (file editing, terminal commands, web search, etc.)

### Agent Types in Our Bootstrap
Our bootstrap repository includes 8 specialized agents:
1. **UI/UX Designer Agent** - Design systems, accessibility, responsive design
2. **Frontend Developer Agent** - React, TypeScript, state management
3. **Backend Developer Agent** - APIs, databases, authentication
4. **QA/Testing Agent** - Test automation, coverage analysis
5. **DevOps Agent** - CI/CD, deployment, monitoring
6. **Project Manager Agent** - Requirements, planning, coordination
7. **Rule-generating Agent** - Creates and manages other agent rules
8. **Global Standards Agent** - Enforces team-wide standards

## Agent Communication Patterns

### 1. Direct Agent Invocation
```
@[agent-name] [your request]

Examples:
@frontend-developer Create a responsive navigation component
@qa-testing Write unit tests for the user authentication flow
@devops Set up CI/CD pipeline for this React project
```

### 2. Context-Based Agent Activation
Agents automatically activate based on:
- **File types** you're working with (.tsx → Frontend Agent)
- **Directory structure** (/tests → QA Agent)
- **Keywords** in your request ("deploy" → DevOps Agent)

### 3. Role-Specific Communication
```
# For UI/UX Designer Agent
"Design a modern dashboard layout with accessibility in mind"
"Create a design system for our React components"

# For Backend Developer Agent  
"Create a REST API for user management with JWT authentication"
"Set up database schema for e-commerce application"

# For QA/Testing Agent
"Write comprehensive tests for this component"
"Analyze test coverage and suggest improvements"
```

## Switching Between Agents

### Method 1: Explicit Agent Switching
```
# Switch to specific agent
@frontend-developer 
Now working on React components...

@backend-developer
Now working on API endpoints...

@qa-testing
Now writing tests for the above components...
```

### Method 2: Rule-Based Switching
Our bootstrap uses `.mdc` rule files that automatically switch agents based on context:

```markdown
# In .cursor/rules/frontend-developer-agent.mdc
This rule activates when:
- Working with .tsx, .jsx, .css files
- Keywords: "component", "react", "frontend", "UI"
- Directories: /src/components, /src/pages
```

### Method 3: Workflow-Based Switching
```
# Sequential agent workflow
1. @project-manager "Plan the user authentication feature"
2. @ui-designer "Design the login/signup interface"  
3. @frontend-developer "Implement the authentication UI"
4. @backend-developer "Create authentication API"
5. @qa-testing "Test the complete authentication flow"
6. @devops "Deploy authentication feature"
```

## Model Selection & Control

### Current Model Switching Methods

#### 1. Keyboard Shortcuts
- **Cmd + /** (Mac) or **Ctrl + /** (Windows) - Cycles through available models
- This loops through: Claude 3.5 Sonnet → GPT-4o → Gemini 2.5 Flash → DeepSeek V3.1

#### 2. Chat Interface Model Selection
- Click the model name in the chat interface
- Select from dropdown menu of available models
- Model selection persists for that chat session

#### 3. Agent-Specific Model Assignment
Our bootstrap includes cost-optimized model mapping:

```yaml
# Agent-to-Model Mapping (Cost Optimized)
UI/UX Designer: Gemini 2.5 Flash → Claude 3.5 Sonnet (complex designs)
Frontend Developer: Gemini 2.5 Flash → Claude 3.5 Sonnet (complex logic)
Backend Developer: DeepSeek V3.1 → Claude 3.5 Sonnet (complex architecture)
QA/Testing: GPT-4o mini → Claude 3.5 Sonnet (complex test scenarios)
DevOps: Grok 3 Mini → Gemini 2.5 Pro (infrastructure)
Project Manager: Cursor Small → GPT-4o (planning)
```

### Model Selection Rules
```markdown
# In .cursor/rules/model-selection-always.mdc
Model Selection Strategy:
1. Start with FREE models (80% of tasks)
   - Gemini 2.5 Flash: UI/UX, simple frontend
   - DeepSeek V3.1: Backend development, APIs
   - GPT-4o mini: Testing, documentation

2. Escalate to PREMIUM models (20% of tasks)
   - Claude 3.5 Sonnet: Complex problem solving
   - GPT-4o: Advanced planning, architecture
   - Gemini 2.5 Pro: Infrastructure, DevOps

3. Auto-escalation triggers:
   - Error after 2 attempts with free model
   - Complex architectural decisions
   - Security-critical implementations
   - Performance optimization needs
```

## Practical Examples

### Example 1: Building a Feature End-to-End
```
# 1. Planning Phase
@project-manager "I need to build a user dashboard with real-time notifications"

# 2. Design Phase  
@ui-designer "Create a modern dashboard layout with notification center"

# 3. Frontend Implementation
@frontend-developer "Implement the dashboard UI with React and TypeScript"

# 4. Backend Implementation
@backend-developer "Create WebSocket API for real-time notifications"

# 5. Testing Phase
@qa-testing "Write comprehensive tests for dashboard and notifications"

# 6. Deployment Phase
@devops "Set up deployment pipeline for the dashboard feature"
```

### Example 2: Model-Specific Tasks
```
# Use free model for simple tasks
@frontend-developer [Gemini 2.5 Flash] "Create a basic button component"

# Escalate to premium for complex tasks
@frontend-developer [Claude 3.5 Sonnet] "Optimize this React app for performance and implement advanced state management"

# Use specialized models
@devops [Grok 3 Mini] "Set up basic Docker configuration"
@devops [Gemini 2.5 Pro] "Design scalable Kubernetes architecture"
```

### Example 3: Context-Aware Switching
```
# Working in /src/components/Button.tsx
# Frontend Agent automatically activates
"Make this button component more accessible"

# Switch to /tests/Button.test.tsx  
# QA Agent automatically activates
"Add more test cases for edge cases"

# Switch to /docker/Dockerfile
# DevOps Agent automatically activates  
"Optimize this Docker build for production"
```

## Best Practices

### 1. Agent Communication
- **Be specific** about the agent role you need
- **Provide context** about the current task/file
- **Use clear, actionable language**
- **Reference existing code/files** when relevant

### 2. Model Selection Strategy
- **Start cheap**: Use free models for initial attempts
- **Escalate smartly**: Switch to premium models for complex problems
- **Monitor usage**: Track your Cursor request consumption
- **Set boundaries**: Define when to use premium vs free models

### 3. Agent Switching Workflow
```
1. Identify the task type
2. Choose appropriate agent
3. Start with cost-effective model
4. Escalate model if needed
5. Hand off to next agent in workflow
6. Document decisions for team
```

### 4. Cost Management
```yaml
Daily Limits:
  Free Models: 80% of requests
  Premium Models: 20% of requests
  
Weekly Review:
  - Analyze model usage patterns
  - Identify optimization opportunities
  - Adjust agent-to-model mappings
  
Monthly Planning:
  - Review cost vs productivity
  - Update model selection rules
  - Train team on best practices
```

## Troubleshooting

### Common Issues & Solutions

#### Issue: Agent Not Responding Correctly
```
Problem: Agent giving generic responses
Solution: 
1. Check if correct .mdc rule file is loaded
2. Verify agent-specific context is provided
3. Use explicit @agent-name invocation
4. Clear chat and restart with specific agent
```

#### Issue: Wrong Model Being Used
```
Problem: Premium model used for simple tasks
Solution:
1. Check model selection rules in .cursor/rules/
2. Use keyboard shortcut to manually switch
3. Update cost optimization rules
4. Set up usage monitoring
```

#### Issue: Agent Context Loss
```
Problem: Agent forgets previous conversation
Solution:
1. Use same chat session for related tasks
2. Reference previous work explicitly
3. Use @agent-name to maintain context
4. Consider using MCP memory tools
```

#### Issue: Model Switching Not Working
```
Problem: Can't switch between models
Solution:
1. Try Cmd+/ (Mac) or Ctrl+/ (Windows)
2. Click model name in chat interface
3. Check Cursor subscription status
4. Restart Cursor if needed
```

### Performance Optimization

#### Memory Management
```
# Clear context when switching major tasks
"Clear previous context, now working on [new task]"

# Maintain context for related work
"Building on the previous component, now add [feature]"
```

#### Request Optimization
```
# Batch related requests
"Create component + tests + documentation in one go"

# Use appropriate model for task complexity
Simple: Gemini 2.5 Flash
Complex: Claude 3.5 Sonnet
```

## Advanced Features

### 1. MCP Integration
Our bootstrap includes MCP servers that enhance agent capabilities:
```
# Web research agent
@research-agent "Find latest React 18 best practices"

# Browser automation agent  
@browser-agent "Test the login flow and take screenshots"

# Database agent
@database-agent "Analyze user table performance"
```

### 2. Background Agents
```
# Set up background monitoring
@devops-agent "Monitor deployment and alert on issues"

# Automated testing
@qa-agent "Run tests on every commit"
```

### 3. Agent Orchestration
```
# Multi-agent workflow
@orchestrator-agent "Coordinate feature development across all agents"
```

## Conclusion

Effective agent communication in Cursor requires:
1. **Understanding each agent's specialization**
2. **Using appropriate models for task complexity**
3. **Following cost-optimization strategies**
4. **Maintaining clear communication patterns**
5. **Leveraging automation where possible**

With our bootstrap repository, you get pre-configured agents, optimized model selection, and proven workflows that maximize productivity while minimizing costs.

---

**Next Steps:**
1. Clone the bootstrap repository
2. Run the setup script to configure agents
3. Start with simple tasks using free models
4. Gradually explore advanced agent workflows
5. Monitor and optimize your usage patterns

For more details, see:
- [MCP_GUIDE.md](MCP_GUIDE.md) - Model Context Protocol integration
- [README.md](../README.md) - Complete bootstrap overview
- [BOOTSTRAP_SUMMARY.md](../BOOTSTRAP_SUMMARY.md) - Repository capabilities 