# Web Development Cursor Bootstrap Repository

A comprehensive starter repository for web development teams using Cursor AI, with optimized agent configurations, rules, and cost-effective model selection strategies.

---

## 🚀 Zero-Friction Setup (Step-by-Step, Safe for Existing Users)

**Copy and paste the following prompt into your Cursor chat to set up this project:**

```
I want to set up this project for use with Cursor AI. Please guide me step by step, and do NOT overwrite or disrupt any of my existing MCP server configurations unless I explicitly confirm. For each step:
- Explain what you are about to do and why
- Ask for my confirmation before making any changes (especially to .cursor/mcp.json or global MCP settings)
- If I have existing MCP servers, show me what will be added or changed, and let me choose to merge, skip, or customize
- After each step, wait for my input before proceeding
- Only initialize the project structure if it is missing
- When configuring Shrimp Task Manager or any other MCP, ensure DATA_DIR is unique to this project and does not conflict with other projects
- At the end, summarize what was set up and provide next steps for using the agents and task manager
- **Also, check if this project is still connected to the original template repository. If so, guide me through:**
  - Removing the original remote (so I don't push to the template by mistake)
  - Adding my own new remote (ask for the URL)
  - Pushing the project to my new repository
  - Explain each step and ask for confirmation before making changes
- **Before making any git changes, check if you have the necessary permissions in Cursor to manage git remotes and push to repositories. If not, guide me to enable these permissions in Cursor settings.**

Let's begin the setup process now.
```

---

## Why Step-by-Step?
- **Protects your existing Cursor/MCP setup**
- **Lets you review and approve each change**
- **Ensures a smooth onboarding for both new and experienced users**

---

## 📋 Table of Contents
- [Agent Overview](#-agent-overview)
- [Repository Structure](#-repository-structure)
- [MCP Integration](#-mcp-integration)
- [Using Shrimp Task Manager](#-using-shrimp-task-manager)
- [Troubleshooting](#-troubleshooting)
- [Best Practices](#-best-practices)

---

## 🤖 Agent Overview

This repository includes optimized AI agent configurations for a complete web development team:

| Agent Role           | Use Case                                      |
|----------------------|-----------------------------------------------|
| 🎨 UI/UX Designer    | Design systems, responsive layouts, a11y      |
| ⚛️ Frontend Dev      | React components, TypeScript, state mgmt      |
| 🔧 Backend Dev       | APIs, databases, authentication, server logic |
| 🧪 QA/Testing        | Test automation, coverage, QA                 |
| 🚀 DevOps            | CI/CD, deployment, monitoring, infrastructure |
| 📋 Project Manager   | Requirements, planning, coordination, docs    |

---

## 📁 Repository Structure

```
web-dev-cursor-bootstrap/
├── .cursor/
│   ├── rules/           # Agent rules (core, global, ts, ui, testing, tool)
│   └── mcp-configs/     # Example MCP server configs
├── docs/                # Documentation and guides
├── scripts/             # (Legacy) Setup scripts (no longer primary)
├── templates/           # Project templates and boilerplates
└── README.md            # This file
```

---

## 🔌 MCP Integration

**Recommended MCP servers (auto-configured by the setup prompt):**
- Web Search
- Browser Tools
- Filesystem
- Git
- SQLite
- Shrimp Task Manager (for project task management)

**Shrimp Task Manager config example:**
```json
{
  "mcpServers": {
    "shrimp-task-manager": {
      "command": "npx",
      "args": ["-y", "mcp-shrimp-task-manager"],
      "env": {
        "DATA_DIR": "/absolute/path/to/your-project/shrimp-data",
        "TEMPLATES_USE": "en",
        "ENABLE_GUI": "false"
      }
    }
  }
}
```
- The agent will set `DATA_DIR` to a unique, absolute path for your project.

---

## 🦐 Using Shrimp Task Manager

- **Plan tasks:** `plan task [your description]`
- **List tasks:** `list tasks`
- **Execute a task:** `execute task [task name or ID]`
- **Research mode:** `research [your topic]`
- **Continuous mode:** `continuous mode`
- **Initialize project rules:** `init project rules`

**Start with the Project Manager agent** to define your PRD and project plan, then use Shrimp for structured task management.

---

## 🛠️ Troubleshooting

- **Node.js not installed:** The agent will prompt you to install it if missing.
- **MCP server not running:** Restart Cursor and check MCP settings.
- **Shrimp DATA_DIR issues:** Ensure the path is absolute and unique per project.
- **Agent not responding:** Try reloading Cursor or starting a new chat.

---

## 🎯 Best Practices
- Use the setup prompt for every new project.
- Keep `.cursor/mcp.json` project-specific.
- Use Shrimp for all task planning and tracking.
- Start with the Project Manager agent for requirements and planning.
- Regularly check MCP server status in Cursor settings.

---

## 🧹 Cleanup
- Legacy setup scripts are still available in `scripts/` for advanced/manual use, but are no longer required for standard onboarding.
- All onboarding is now prompt-driven for maximum simplicity.

## 💰 Cost Optimization Strategy

**Cursor Business Version ($40/month):**
- **80% FREE models** for initial development and iteration
- **20% premium models** for complex problems and final polish
- **Estimated monthly cost:** $40 base + ~$10-20 in premium model usage
- **Total cost:** ~$50-60/month vs $500+ with premium-only approach

### Model Selection Logic
1. **Start with FREE models** for all initial work
2. **Escalate to premium models** only when:
   - Complex architectural decisions needed
   - Performance optimization required
   - Final code review and polish
   - Critical bug resolution

## 💡 Usage Examples

### Frontend Development
```typescript
// The Frontend Developer agent will help you create components like this:
interface ButtonProps {
  children: React.ReactNode;
  onClick: () => void;
  variant?: 'primary' | 'secondary';
}

export const Button: React.FC<ButtonProps> = ({ children, onClick, variant = 'primary' }) => {
  return (
    <button
      onClick={onClick}
      className={`px-4 py-2 rounded-md font-medium transition-colors ${
        variant === 'primary' 
          ? 'bg-blue-600 text-white hover:bg-blue-700' 
          : 'bg-gray-200 text-gray-900 hover:bg-gray-300'
      }`}
    >
      {children}
    </button>
  );
};
```

### Testing with QA Agent
```typescript
// The QA/Testing agent will help you write comprehensive tests:
describe('Button Component', () => {
  it('should render with correct variant styles', () => {
    render(<Button onClick={jest.fn()} variant="primary">Click me</Button>);
    
    const button = screen.getByRole('button', { name: /click me/i });
    expect(button).toHaveClass('bg-blue-600', 'text-white');
  });
});
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Adding New Rules

When adding new rules, follow the established patterns:
1. Choose the appropriate folder (`core-rules`, `global-rules`, etc.)
2. Use the correct naming convention (`rule-name-{type}.mdc`)
3. Include comprehensive examples (valid and invalid)
4. Test the rule with different scenarios

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Based on research from our AI Models Agent Mapping Analysis
- Inspired by BMad's cursor-custom-agents-rules-generator
- Optimized for Cursor Business version cost efficiency
- Built for modern web development teams

---

**Ready to supercharge your web development with AI agents?** 🚀

Clone this repository as your project template and let the AI agents guide you to better, faster, and more cost-effective development! 