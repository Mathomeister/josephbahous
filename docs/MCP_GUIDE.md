# MCP (Model Context Protocol) Guide for Web Development

## 🚀 Overview

Model Context Protocol (MCP) is a game-changing technology that extends Cursor's AI capabilities by connecting it to external tools, data sources, and services. Think of MCP as a "USB protocol for AI" - it allows your AI agents to interact with browsers, databases, APIs, and more.

## 📋 Table of Contents

- [What is MCP?](#what-is-mcp)
- [Essential MCPs for Web Development](#essential-mcps-for-web-development)
- [Quick Setup Guide](#quick-setup-guide)
- [MCP Configurations by Agent Role](#mcp-configurations-by-agent-role)
- [Advanced Configurations](#advanced-configurations)
- [Troubleshooting](#troubleshooting)
- [Custom MCP Development](#custom-mcp-development)

## What is MCP?

MCP enables AI agents to:
- **Browse the web** and scrape content
- **Interact with databases** and perform queries
- **Access file systems** and manage project files
- **Integrate with APIs** and external services
- **Automate browser tasks** for testing and debugging
- **Connect to cloud services** like AWS, Vercel, Netlify

### Benefits for Web Development Teams

1. **Enhanced Research**: AI can search the web for latest documentation, solutions, and trends
2. **Database Integration**: Direct database queries and schema analysis
3. **Browser Automation**: Automated testing, debugging, and performance analysis
4. **Cloud Integration**: Deploy, monitor, and manage cloud resources
5. **Project Management**: Integration with GitHub, Slack, Notion for better coordination

## Essential MCPs for Web Development

### 🔍 Research & Information Gathering

| MCP | Purpose | Agent Roles | Free/Paid |
|-----|---------|-------------|-----------|
| **Web Search** | Google/Bing search integration | All agents | Free |
| **Brave Search** | Privacy-focused search with API | All agents | Free tier |
| **Perplexity** | AI-powered research and answers | PM, QA | Paid |
| **Firecrawl** | Advanced web scraping and crawling | All agents | Free tier |

### 🌐 Browser & Testing

| MCP | Purpose | Agent Roles | Free/Paid |
|-----|---------|-------------|-----------|
| **Browser Tools** | Browser automation, screenshots, debugging | QA, Frontend | Free |
| **Playwright** | E2E testing automation | QA | Free |

### 💾 Data & Storage

| MCP | Purpose | Agent Roles | Free/Paid |
|-----|---------|-------------|-----------|
| **PostgreSQL** | Database queries and management | Backend | Free |
| **SQLite** | Local database operations | Backend, QA | Free |
| **Filesystem** | File system access and management | All agents | Free |

### ☁️ Cloud & Deployment

| MCP | Purpose | Agent Roles | Free/Paid |
|-----|---------|-------------|-----------|
| **Vercel** | Deployment and project management | DevOps | Free tier |
| **Netlify** | Static site deployment | DevOps | Free tier |
| **AWS** | Cloud services integration | DevOps | Pay per use |
| **Docker** | Container management | DevOps | Free |

### 🔧 Development Tools

| MCP | Purpose | Agent Roles | Free/Paid |
|-----|---------|-------------|-----------|
| **GitHub** | Repository management, issues, PRs | All agents | Free |
| **Git** | Local Git operations | All agents | Free |

### 📋 Project Management

| MCP | Purpose | Agent Roles | Free/Paid |
|-----|---------|-------------|-----------|
| **Slack** | Team communication integration | PM | Free tier |
| **Notion** | Documentation and project management | PM | Free tier |
| **Google Drive** | Document and file sharing | PM | Free tier |

## Quick Setup Guide

### 1. Global MCP Configuration

Create `~/.cursor/mcp.json` for tools you want across all projects:

```json
{
  "mcpServers": {
    "web-search": {
      "command": "npx",
      "args": ["-y", "@smithery/cli@latest", "run", "@mzxrai/mcp-webresearch", "--config", "{}"]
    },
    "browser-tools": {
      "command": "npx",
      "args": ["-y", "mcp-browser-tools@latest"]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github@latest"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_token_here"
      }
    }
  }
}
```

### 2. Project-Specific MCP Configuration

Create `.cursor/mcp.json` in your project root:

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem@latest", "."]
    },
    "git": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-git@latest"]
    },
    "sqlite": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sqlite@latest", "--db-path", "./database.sqlite"]
    }
  }
}
```

### 3. Environment Variables Setup

Create `.env.mcp` file for sensitive configuration:

```bash
# Search APIs
BRAVE_API_KEY=your_brave_api_key
PERPLEXITY_API_KEY=your_perplexity_key
FIRECRAWL_API_KEY=your_firecrawl_key

# Development Tools
GITHUB_PERSONAL_ACCESS_TOKEN=your_github_token

# Cloud Services
VERCEL_TOKEN=your_vercel_token
NETLIFY_ACCESS_TOKEN=your_netlify_token
AWS_ACCESS_KEY_ID=your_aws_key
AWS_SECRET_ACCESS_KEY=your_aws_secret

# Communication
SLACK_BOT_TOKEN=your_slack_token
NOTION_API_KEY=your_notion_key

# Database
POSTGRES_CONNECTION_STRING=postgresql://user:pass@localhost:5432/db
```

## MCP Configurations by Agent Role

### 🎨 UI/UX Designer

**Essential MCPs:**
- Web Search (research design trends)
- Browser Tools (test responsive design)
- Firecrawl (analyze competitor sites)
- Notion (design documentation)

```json
{
  "mcpServers": {
    "web-search": {
      "command": "npx",
      "args": ["-y", "@smithery/cli@latest", "run", "@mzxrai/mcp-webresearch", "--config", "{}"]
    },
    "browser-tools": {
      "command": "npx",
      "args": ["-y", "mcp-browser-tools@latest"]
    },
    "firecrawl": {
      "command": "npx",
      "args": ["-y", "@firecrawl/mcp-server@latest"],
      "env": {
        "FIRECRAWL_API_KEY": "YOUR_API_KEY"
      }
    }
  }
}
```

### ⚛️ Frontend Developer

**Essential MCPs:**
- Browser Tools (debugging, testing)
- Web Search (documentation lookup)
- GitHub (code management)
- Filesystem (project management)

```json
{
  "mcpServers": {
    "browser-tools": {
      "command": "npx",
      "args": ["-y", "mcp-browser-tools@latest"]
    },
    "web-search": {
      "command": "npx",
      "args": ["-y", "@smithery/cli@latest", "run", "@mzxrai/mcp-webresearch", "--config", "{}"]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github@latest"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_TOKEN"
      }
    },
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem@latest", "."]
    }
  }
}
```

### 🔧 Backend Developer

**Essential MCPs:**
- PostgreSQL/SQLite (database operations)
- GitHub (code management)
- Docker (containerization)
- AWS (cloud services)

```json
{
  "mcpServers": {
    "postgres": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres@latest"],
      "env": {
        "POSTGRES_CONNECTION_STRING": "YOUR_CONNECTION_STRING"
      }
    },
    "docker": {
      "command": "npx",
      "args": ["-y", "mcp-server-docker@latest"]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github@latest"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_TOKEN"
      }
    }
  }
}
```

### 🧪 QA/Testing

**Essential MCPs:**
- Browser Tools (automated testing)
- Playwright (E2E testing)
- Web Search (bug research)
- GitHub (issue tracking)

```json
{
  "mcpServers": {
    "browser-tools": {
      "command": "npx",
      "args": ["-y", "mcp-browser-tools@latest"]
    },
    "playwright": {
      "command": "npx",
      "args": ["-y", "mcp-server-playwright@latest"]
    },
    "web-search": {
      "command": "npx",
      "args": ["-y", "@smithery/cli@latest", "run", "@mzxrai/mcp-webresearch", "--config", "{}"]
    }
  }
}
```

### 🚀 DevOps

**Essential MCPs:**
- Docker (container management)
- AWS/Vercel/Netlify (deployment)
- GitHub (CI/CD integration)
- Slack (notifications)

```json
{
  "mcpServers": {
    "docker": {
      "command": "npx",
      "args": ["-y", "mcp-server-docker@latest"]
    },
    "vercel": {
      "command": "npx",
      "args": ["-y", "mcp-server-vercel@latest"],
      "env": {
        "VERCEL_TOKEN": "YOUR_TOKEN"
      }
    },
    "aws": {
      "command": "npx",
      "args": ["-y", "mcp-server-aws@latest"],
      "env": {
        "AWS_ACCESS_KEY_ID": "YOUR_KEY",
        "AWS_SECRET_ACCESS_KEY": "YOUR_SECRET"
      }
    }
  }
}
```

### 📋 Project Manager

**Essential MCPs:**
- Slack (team communication)
- Notion (documentation)
- GitHub (project tracking)
- Google Drive (file management)

```json
{
  "mcpServers": {
    "slack": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-slack@latest"],
      "env": {
        "SLACK_BOT_TOKEN": "YOUR_TOKEN"
      }
    },
    "notion": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-notion@latest"],
      "env": {
        "NOTION_API_KEY": "YOUR_KEY"
      }
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github@latest"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_TOKEN"
      }
    }
  }
}
```

## Advanced Configurations

### Cost-Optimized Setup

For budget-conscious teams, prioritize free MCPs:

```json
{
  "mcpServers": {
    "web-search": {
      "command": "npx",
      "args": ["-y", "@smithery/cli@latest", "run", "@mzxrai/mcp-webresearch", "--config", "{}"]
    },
    "browser-tools": {
      "command": "npx",
      "args": ["-y", "mcp-browser-tools@latest"]
    },
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem@latest", "."]
    },
    "git": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-git@latest"]
    },
    "sqlite": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sqlite@latest", "--db-path", "./database.sqlite"]
    }
  }
}
```

### Enterprise Setup

For larger teams with budget for premium services:

```json
{
  "mcpServers": {
    "perplexity": {
      "command": "npx",
      "args": ["-y", "perplexity-mcp@latest"],
      "env": {
        "PERPLEXITY_API_KEY": "YOUR_KEY"
      }
    },
    "firecrawl": {
      "command": "npx",
      "args": ["-y", "@firecrawl/mcp-server@latest"],
      "env": {
        "FIRECRAWL_API_KEY": "YOUR_KEY"
      }
    },
    "aws": {
      "command": "npx",
      "args": ["-y", "mcp-server-aws@latest"],
      "env": {
        "AWS_ACCESS_KEY_ID": "YOUR_KEY",
        "AWS_SECRET_ACCESS_KEY": "YOUR_SECRET"
      }
    }
  }
}
```

## Troubleshooting

### Common Issues

1. **MCP Server Not Loading**
   - Check if Node.js is installed and updated
   - Verify the command path and arguments
   - Check environment variables

2. **Permission Errors**
   - Ensure proper file permissions
   - Check API key validity
   - Verify network connectivity

3. **Performance Issues**
   - Limit the number of active MCP servers
   - Use project-specific configurations
   - Monitor resource usage

### Debug Commands

```bash
# Test MCP server manually
npx -y @smithery/cli@latest run @mzxrai/mcp-webresearch --config "{}"

# Check Node.js version
node --version

# Verify npm packages
npm list -g --depth=0
```

## Custom MCP Development

### Creating a Custom MCP Server

For specialized needs, you can create custom MCP servers:

```typescript
// example-mcp-server.ts
import { Server } from '@modelcontextprotocol/sdk/server/index.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';

const server = new Server(
  {
    name: 'custom-web-dev-server',
    version: '0.1.0',
  },
  {
    capabilities: {
      tools: {},
    },
  }
);

// Add custom tools for web development
server.setRequestHandler('tools/list', async () => {
  return {
    tools: [
      {
        name: 'analyze_performance',
        description: 'Analyze web performance metrics',
        inputSchema: {
          type: 'object',
          properties: {
            url: { type: 'string' },
          },
        },
      },
    ],
  };
});

// Start server
const transport = new StdioServerTransport();
server.connect(transport);
```

## Best Practices

1. **Start Small**: Begin with essential free MCPs
2. **Role-Specific**: Configure MCPs based on agent roles
3. **Security**: Use environment variables for sensitive data
4. **Performance**: Monitor MCP server resource usage
5. **Documentation**: Document your MCP configurations
6. **Testing**: Test MCP integrations regularly
7. **Updates**: Keep MCP servers updated

## Conclusion

MCPs transform Cursor from a code editor into a comprehensive development platform. By strategically implementing MCPs based on your team's roles and needs, you can dramatically improve productivity while maintaining cost efficiency.

Start with the free essentials, then gradually add premium services as your team grows and requirements evolve. 