# Web Development Cursor Bootstrap Repository

A comprehensive bootstrap repository for web development teams using Cursor AI with optimized agent configurations, rules, and cost-effective model selection strategies.

## 🚀 Quick Start

1. **Use this repository as a template** for your new project
2. **Clone and rename** to your project name
3. **Run the setup script** to initialize everything
4. **Start developing** with AI-powered agents optimized for your role

```bash
# Method 1: Use GitHub template (Recommended)
# 1. Click "Use this template" button on GitHub
# 2. Create your new repository
# 3. Clone your new repo
git clone <your-new-repo-url>
cd your-project-name
./scripts/setup.sh

# Method 2: Clone and rename manually
git clone <this-repo-url> my-awesome-project
cd my-awesome-project

# Remove original git history and start fresh
rm -rf .git
git init
git add .
git commit -m "Initial commit from web-dev-cursor-bootstrap"

# Run setup script to configure the project
./scripts/setup.sh

# Start development
npm run dev
```

## 📋 Table of Contents

- [Agent Overview](#-agent-overview)
- [Cost Optimization Strategy](#-cost-optimization-strategy)
- [Repository Structure](#-repository-structure)
- [Agent Configuration](#-agent-configuration)
- [Getting Started](#-getting-started)
- [MCP Integration](#-mcp-integration)
- [Usage Examples](#-usage-examples)
- [Best Practices](#-best-practices)
- [Contributing](#-contributing)

## 🤖 Agent Overview

This repository includes optimized AI agent configurations for a complete web development team:

| Agent Role | Primary Model | Secondary Model | Use Case |
|------------|---------------|-----------------|----------|
| 🎨 **UI/UX Designer** | Gemini 2.5 Flash (FREE) | Claude 3.5 Sonnet | Design systems, responsive layouts, accessibility |
| ⚛️ **Frontend Developer** | Gemini 2.5 Flash (FREE) | Claude 3.5 Sonnet | React components, TypeScript, state management |
| 🔧 **Backend Developer** | DeepSeek V3.1 (FREE) | Claude 3.5 Sonnet | APIs, databases, authentication, server logic |
| 🧪 **QA/Testing** | GPT-4o mini (FREE) | Claude 3.5 Sonnet | Test automation, coverage analysis, quality assurance |
| 🚀 **DevOps** | Grok 3 Mini (FREE) | Gemini 2.5 Pro | CI/CD, deployment, monitoring, infrastructure |
| 📋 **Project Manager** | Cursor Small (FREE) | GPT-4o | Requirements, planning, coordination, documentation |

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

## 📁 Repository Structure

```
web-dev-cursor-bootstrap/
├── .cursor/
│   ├── rules/
│   │   ├── core-rules/           # Rule generation and core behavior
│   │   ├── global-rules/         # Always-applied team standards
│   │   ├── ts-rules/            # TypeScript and JavaScript specific
│   │   ├── ui-rules/            # React, CSS, design system rules
│   │   ├── testing-rules/       # Testing strategies and QA
│   │   └── tool-rules/          # DevOps, CI/CD, tooling
│   └── mcp-configs/             # MCP server configurations
├── docs/                        # Documentation and guides
│   └── MCP_GUIDE.md            # Comprehensive MCP setup guide
├── scripts/                     # Setup and utility scripts
│   ├── setup.sh               # Main project setup script
│   └── setup-mcp.sh           # MCP configuration script
├── templates/                   # Project templates and boilerplates
│   ├── .cursor/mcp.json       # Basic MCP configuration
│   ├── .github/workflows/     # CI/CD templates
│   ├── package.json           # Dependencies template
│   ├── Dockerfile             # Container template
│   └── nginx.conf             # Web server configuration
└── README.md                    # This file
```

## ⚙️ Agent Configuration

### Rule Types Explained

- **Always Rules** (`-always.mdc`): Applied to every conversation
- **Agent Rules** (`-agent.mdc`): Applied when specific expertise is needed
- **Auto Rules** (`-auto.mdc`): Applied automatically based on file patterns
- **Manual Rules** (`-manual.mdc`): Applied manually when needed

### Key Features

- **Role-based expertise**: Each agent has specialized knowledge and best practices
- **Cost-aware model selection**: Optimized for Cursor Business pricing
- **Modern tech stack**: React 18+, TypeScript 5+, Tailwind CSS 3+, Vite
- **Quality standards**: Testing, accessibility, performance, security built-in
- **Team coordination**: Clear handoff processes between different roles
- **MCP Integration**: Pre-configured Model Context Protocol servers for enhanced AI capabilities
- **Browser Automation**: Built-in browser tools for testing and debugging
- **Cloud Integration**: Ready-to-use configurations for AWS, Vercel, Netlify

## 🏁 Getting Started

### 1. Set Up Your Project

```bash
# Use this repository as a template
git clone <this-repo-url> my-awesome-project
cd my-awesome-project

# Remove original git history and start fresh
rm -rf .git
git init

# Run the setup script
./scripts/setup.sh

# The script will:
# - Configure the project structure
# - Set up package.json with your project name
# - Create all necessary configuration files
# - Set up MCP if desired
```

### 2. Configure Your Environment

```bash
# Initialize Tailwind CSS
npx tailwindcss init -p

# Set up testing
npm install -D @testing-library/user-event jest-environment-jsdom

# Configure ESLint and Prettier
npm install -D eslint prettier eslint-config-prettier
```

### 3. Configure MCP Servers (Optional but Recommended)

```bash
# Run the MCP setup script
./scripts/setup-mcp.sh

# Or manually copy MCP configuration
cp templates/.cursor/mcp.json .cursor/
```

### 4. Start Using Agents

Open Cursor and start coding! The agents will automatically:
- Apply appropriate rules based on your current task
- Suggest best practices for your role
- Optimize for cost by using free models first
- Escalate to premium models when needed
- Use MCP tools for enhanced capabilities (web search, browser automation, etc.)

## 🔌 MCP Integration

This bootstrap repository includes comprehensive Model Context Protocol (MCP) configurations that extend your AI agents' capabilities:

### Available MCP Tools

| Category | Tools | Capabilities |
|----------|-------|-------------|
| **Research** | Web Search, Brave Search, Perplexity | Real-time web research, documentation lookup |
| **Browser** | Browser Tools, Playwright | Automated testing, debugging, screenshots |
| **Development** | GitHub, Git, Filesystem | Code management, file operations |
| **Database** | PostgreSQL, SQLite | Database queries, schema analysis |
| **Cloud** | AWS, Vercel, Netlify, Docker | Deployment, monitoring, container management |
| **Communication** | Slack, Notion, Google Drive | Team coordination, documentation |

### Quick MCP Setup

```bash
# Interactive MCP configuration
./scripts/setup-mcp.sh

# Choose from:
# 1. Quick Setup (free tools only)
# 2. Role-based Setup (optimized for your agent role)
# 3. Full Setup (all tools with API keys)
# 4. Custom Setup (manual selection)
```

### MCP Usage Examples

```bash
# AI can now search the web for solutions
"Search for React 18 best practices and summarize the top 5 recommendations"

# Browser automation for testing
"Take a screenshot of our homepage and analyze the accessibility issues"

# Database operations
"Show me the schema for the users table and suggest optimizations"

# Cloud deployment
"Deploy this React app to Vercel and configure the custom domain"
```

For detailed MCP configuration, see [MCP_GUIDE.md](docs/MCP_GUIDE.md).

For agent communication and switching, see [AGENT_COMMUNICATION_GUIDE.md](docs/AGENT_COMMUNICATION_GUIDE.md).

For research findings and methodology, see [AGENT_RESEARCH_SUMMARY.md](docs/AGENT_RESEARCH_SUMMARY.md).

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

## 🎯 Best Practices

### Cost Management
- Start every task with FREE models (Gemini 2.5 Flash, DeepSeek V3.1)
- Use premium models (Claude 3.5 Sonnet) only for complex problems
- Monitor your Cursor usage dashboard regularly
- Set up alerts for unusual usage patterns

### Team Collaboration
- Use conventional commits for clear history
- Follow the agent role guidelines for consistency
- Document decisions in the project wiki
- Regular code reviews with the appropriate agent

### Quality Assurance
- Maintain >80% test coverage
- Run accessibility audits regularly
- Monitor Core Web Vitals
- Implement proper error boundaries

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