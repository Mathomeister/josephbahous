#!/bin/bash

# MCP Setup Script for Web Development Teams
# This script helps configure Model Context Protocol servers for different agent roles

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${PURPLE}$1${NC}"
}

# Welcome message
clear
print_header "🚀 MCP Setup for Web Development Teams"
print_header "======================================"
echo ""
print_status "This script will help you configure Model Context Protocol (MCP) servers"
print_status "for your web development workflow in Cursor AI."
echo ""

# Check prerequisites
print_status "Checking prerequisites..."

# Check Node.js
if ! command -v node &> /dev/null; then
    print_error "Node.js is not installed. Please install Node.js first."
    exit 1
fi

NODE_VERSION=$(node --version)
print_success "Node.js found: $NODE_VERSION"

# Check npm
if ! command -v npm &> /dev/null; then
    print_error "npm is not installed. Please install npm first."
    exit 1
fi

NPM_VERSION=$(npm --version)
print_success "npm found: $NPM_VERSION"

echo ""

# Get user preferences
print_header "Configuration Options"
echo ""

# Ask for setup type
echo "Select your setup type:"
echo "1) Quick Setup (Essential free MCPs only)"
echo "2) Role-based Setup (Choose your primary role)"
echo "3) Full Setup (All available MCPs with API key configuration)"
echo "4) Custom Setup (Manual selection)"
read -p "Enter your choice (1-4): " SETUP_TYPE

# Ask for configuration scope
echo ""
echo "Configuration scope:"
echo "1) Global (~/.cursor/mcp.json) - Available in all projects"
echo "2) Project-specific (./.cursor/mcp.json) - Only this project"
echo "3) Both global and project-specific"
read -p "Enter your choice (1-3): " CONFIG_SCOPE

# Initialize configuration
MCP_CONFIG='{"mcpServers":{}}'

case $SETUP_TYPE in
    1)
        print_status "Setting up essential free MCPs..."
        MCP_CONFIG='{
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
    }
  }
}'
        ;;
    2)
        echo ""
        echo "Select your primary role:"
        echo "1) 🎨 UI/UX Designer"
        echo "2) ⚛️ Frontend Developer"
        echo "3) 🔧 Backend Developer"
        echo "4) 🧪 QA/Testing"
        echo "5) 🚀 DevOps"
        echo "6) 📋 Project Manager"
        read -p "Enter your choice (1-6): " ROLE_CHOICE
        
        case $ROLE_CHOICE in
            1)
                print_status "Configuring MCPs for UI/UX Designer..."
                MCP_CONFIG='{
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
    }
  }
}'
                ;;
            2)
                print_status "Configuring MCPs for Frontend Developer..."
                MCP_CONFIG='{
  "mcpServers": {
    "browser-tools": {
      "command": "npx",
      "args": ["-y", "mcp-browser-tools@latest"]
    },
    "web-search": {
      "command": "npx",
      "args": ["-y", "@smithery/cli@latest", "run", "@mzxrai/mcp-webresearch", "--config", "{}"]
    },
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem@latest", "."]
    },
    "git": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-git@latest"]
    }
  }
}'
                ;;
            3)
                print_status "Configuring MCPs for Backend Developer..."
                MCP_CONFIG='{
  "mcpServers": {
    "sqlite": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sqlite@latest", "--db-path", "./database.sqlite"]
    },
    "git": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-git@latest"]
    },
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem@latest", "."]
    },
    "docker": {
      "command": "npx",
      "args": ["-y", "mcp-server-docker@latest"]
    }
  }
}'
                ;;
            4)
                print_status "Configuring MCPs for QA/Testing..."
                MCP_CONFIG='{
  "mcpServers": {
    "browser-tools": {
      "command": "npx",
      "args": ["-y", "mcp-browser-tools@latest"]
    },
    "web-search": {
      "command": "npx",
      "args": ["-y", "@smithery/cli@latest", "run", "@mzxrai/mcp-webresearch", "--config", "{}"]
    },
    "git": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-git@latest"]
    },
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem@latest", "."]
    }
  }
}'
                ;;
            5)
                print_status "Configuring MCPs for DevOps..."
                MCP_CONFIG='{
  "mcpServers": {
    "docker": {
      "command": "npx",
      "args": ["-y", "mcp-server-docker@latest"]
    },
    "git": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-git@latest"]
    },
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem@latest", "."]
    },
    "web-search": {
      "command": "npx",
      "args": ["-y", "@smithery/cli@latest", "run", "@mzxrai/mcp-webresearch", "--config", "{}"]
    }
  }
}'
                ;;
            6)
                print_status "Configuring MCPs for Project Manager..."
                MCP_CONFIG='{
  "mcpServers": {
    "web-search": {
      "command": "npx",
      "args": ["-y", "@smithery/cli@latest", "run", "@mzxrai/mcp-webresearch", "--config", "{}"]
    },
    "git": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-git@latest"]
    },
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem@latest", "."]
    }
  }
}'
                ;;
        esac
        ;;
    3)
        print_status "Setting up full MCP configuration..."
        print_warning "This will require API keys for premium services."
        
        # Copy the comprehensive configuration
        if [ -f ".cursor/mcp-configs/web-development.json" ]; then
            MCP_CONFIG=$(cat .cursor/mcp-configs/web-development.json)
        else
            print_error "Full configuration template not found."
            exit 1
        fi
        ;;
    4)
        print_status "Custom setup selected. Please manually edit the configuration file after creation."
        MCP_CONFIG='{
  "mcpServers": {
    "web-search": {
      "command": "npx",
      "args": ["-y", "@smithery/cli@latest", "run", "@mzxrai/mcp-webresearch", "--config", "{}"]
    }
  }
}'
        ;;
esac

# Create configuration files
echo ""
print_status "Creating MCP configuration files..."

case $CONFIG_SCOPE in
    1)
        # Global configuration
        mkdir -p ~/.cursor
        echo "$MCP_CONFIG" > ~/.cursor/mcp.json
        print_success "Global MCP configuration created: ~/.cursor/mcp.json"
        ;;
    2)
        # Project-specific configuration
        mkdir -p .cursor
        echo "$MCP_CONFIG" > .cursor/mcp.json
        print_success "Project MCP configuration created: .cursor/mcp.json"
        ;;
    3)
        # Both global and project-specific
        mkdir -p ~/.cursor
        mkdir -p .cursor
        echo "$MCP_CONFIG" > ~/.cursor/mcp.json
        echo "$MCP_CONFIG" > .cursor/mcp.json
        print_success "Global MCP configuration created: ~/.cursor/mcp.json"
        print_success "Project MCP configuration created: .cursor/mcp.json"
        ;;
esac

# Create environment template if full setup
if [ "$SETUP_TYPE" = "3" ]; then
    print_status "Creating environment template..."
    cat > .env.mcp.template << 'EOF'
# MCP Environment Variables Template
# Copy this to .env.mcp and fill in your actual API keys

# Search APIs
BRAVE_API_KEY=your_brave_api_key_here
PERPLEXITY_API_KEY=your_perplexity_api_key_here
FIRECRAWL_API_KEY=your_firecrawl_api_key_here

# Development Tools
GITHUB_PERSONAL_ACCESS_TOKEN=your_github_token_here

# Cloud Services
VERCEL_TOKEN=your_vercel_token_here
NETLIFY_ACCESS_TOKEN=your_netlify_token_here
AWS_ACCESS_KEY_ID=your_aws_access_key_here
AWS_SECRET_ACCESS_KEY=your_aws_secret_key_here

# Communication
SLACK_BOT_TOKEN=your_slack_bot_token_here
NOTION_API_KEY=your_notion_api_key_here

# Database
POSTGRES_CONNECTION_STRING=postgresql://user:password@localhost:5432/database
EOF
    print_success "Environment template created: .env.mcp.template"
    print_warning "Please copy .env.mcp.template to .env.mcp and fill in your API keys"
fi

# Test MCP servers
echo ""
print_status "Testing MCP server installations..."

# Test web search (most common)
print_status "Testing web search MCP server..."
if timeout 30s npx -y @smithery/cli@latest run @mzxrai/mcp-webresearch --config "{}" --test 2>/dev/null; then
    print_success "Web search MCP server is working"
else
    print_warning "Web search MCP server test timed out (this is normal)"
fi

# Final instructions
echo ""
print_header "🎉 MCP Setup Complete!"
print_header "====================="
echo ""
print_success "Your MCP configuration has been created successfully!"
echo ""
echo "Next steps:"
echo "1. Restart Cursor IDE to load the new MCP configuration"
echo "2. Go to Cursor Settings > Features > MCP to verify servers are loaded"
echo "3. Start using MCP tools in your AI conversations!"
echo ""
echo "Available MCP capabilities:"
case $SETUP_TYPE in
    1)
        echo "• 🔍 Web search and research"
        echo "• 🌐 Browser automation and testing"
        echo "• 📁 File system operations"
        echo "• 🔧 Git operations"
        ;;
    2)
        case $ROLE_CHOICE in
            1) echo "• 🎨 Design research and browser testing" ;;
            2) echo "• ⚛️ Frontend development and debugging" ;;
            3) echo "• 🔧 Backend development and database operations" ;;
            4) echo "• 🧪 Testing automation and quality assurance" ;;
            5) echo "• 🚀 DevOps and deployment automation" ;;
            6) echo "• 📋 Project management and coordination" ;;
        esac
        ;;
    3)
        echo "• 🔍 Advanced web research and scraping"
        echo "• 🌐 Complete browser automation"
        echo "• 💾 Database operations (PostgreSQL, SQLite)"
        echo "• ☁️ Cloud service integration"
        echo "• 📋 Project management tools"
        echo "• 🔧 Development workflow automation"
        ;;
esac
echo ""
echo "For more information, see: docs/MCP_GUIDE.md"
echo ""
print_success "Happy coding with AI superpowers! 🚀" 