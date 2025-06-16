#!/bin/bash

# Web Development Cursor Bootstrap Setup Script
# This script helps you set up a new project with optimized AI agent configurations

set -e

echo "🚀 Web Development Cursor Bootstrap Setup"
echo "=========================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
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

# Check if we're in the right directory
if [ ! -d ".cursor" ]; then
    print_error "No .cursor directory found. Please run this script from the project root directory."
    exit 1
fi

# Get project name from current directory or user input
CURRENT_DIR=$(basename "$PWD")
if [ "$CURRENT_DIR" = "web-dev-cursor-bootstrap" ]; then
    read -p "Enter your project name (this will rename the directory): " PROJECT_NAME
    if [ -z "$PROJECT_NAME" ]; then
        print_error "Project name is required when running from web-dev-cursor-bootstrap directory."
        exit 1
    fi
    RENAME_NEEDED=true
else
    PROJECT_NAME="$CURRENT_DIR"
    RENAME_NEEDED=false
    print_status "Using current directory name as project name: $PROJECT_NAME"
fi

# Get project type
echo ""
echo "Select project type:"
echo "1) React + TypeScript + Vite (Recommended)"
echo "2) Next.js + TypeScript"
echo "3) Copy rules only (existing project)"
read -p "Enter your choice (1-3): " PROJECT_TYPE

case $PROJECT_TYPE in
    1)
        print_status "Setting up React + TypeScript + Vite project..."
        PROJECT_TEMPLATE="react-ts"
        ;;
    2)
        print_status "Setting up Next.js + TypeScript project..."
        PROJECT_TEMPLATE="nextjs-ts"
        ;;
    3)
        print_status "Copying rules to existing project..."
        PROJECT_TEMPLATE="rules-only"
        ;;
    *)
        print_error "Invalid choice. Defaulting to React + TypeScript + Vite."
        PROJECT_TEMPLATE="react-ts"
        ;;
esac

# Handle directory setup
if [ "$PROJECT_TEMPLATE" != "rules-only" ]; then
    if [ "$RENAME_NEEDED" = true ]; then
        # We're in web-dev-cursor-bootstrap and need to rename
        print_status "Setting up project in current directory (will be renamed to $PROJECT_NAME)"
        # We'll rename at the end
    else
        # We're already in the renamed directory
        print_status "Setting up project in current directory: $PROJECT_NAME"
    fi
fi

# Cursor rules are already in place
print_status "Cursor AI agent rules are ready!"
print_success "All agent configurations are in place in .cursor/ directory"

# Set up project based on template
case $PROJECT_TEMPLATE in
    "react-ts")
        print_status "Creating React + TypeScript + Vite project..."
        
        # Copy package.json template
        cp "templates/package.json" .
        sed -i.bak "s/web-dev-project/$PROJECT_NAME/g" package.json && rm package.json.bak
        
        # Create basic project structure
        mkdir -p src/{components,hooks,utils,types,__tests__}
        mkdir -p public
        
        # Create basic files
        cat > src/main.tsx << 'EOF'
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.tsx'
import './index.css'

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
EOF

        cat > src/App.tsx << 'EOF'
import React from 'react'

function App() {
  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center">
      <div className="max-w-md mx-auto text-center">
        <h1 className="text-4xl font-bold text-gray-900 mb-4">
          Welcome to Your Web App
        </h1>
        <p className="text-gray-600 mb-8">
          Built with React, TypeScript, and Cursor AI agents
        </p>
        <button className="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition-colors">
          Get Started
        </button>
      </div>
    </div>
  )
}

export default App
EOF

        cat > src/index.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
    'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue',
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
EOF

        cat > src/setupTests.ts << 'EOF'
import '@testing-library/jest-dom'
EOF

        cat > index.html << EOF
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/vite.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>$PROJECT_NAME</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.tsx"></script>
  </body>
</html>
EOF

        # Create configuration files
        cat > vite.config.ts << 'EOF'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import path from 'path'

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
})
EOF

        cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOF

        cat > postcss.config.js << 'EOF'
export default {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF

        cat > tsconfig.json << 'EOF'
{
  "compilerOptions": {
    "target": "ES2020",
    "useDefineForClassFields": true,
    "lib": ["ES2020", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "skipLibCheck": true,
    "moduleResolution": "bundler",
    "allowImportingTsExtensions": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "jsx": "react-jsx",
    "strict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true,
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    }
  },
  "include": ["src"],
  "references": [{ "path": "./tsconfig.node.json" }]
}
EOF

        cat > tsconfig.node.json << 'EOF'
{
  "compilerOptions": {
    "composite": true,
    "skipLibCheck": true,
    "module": "ESNext",
    "moduleResolution": "bundler",
    "allowSyntheticDefaultImports": true
  },
  "include": ["vite.config.ts"]
}
EOF

        print_success "React + TypeScript + Vite project structure created!"
        ;;
        
    "nextjs-ts")
        print_status "Setting up Next.js project (using npx create-next-app)..."
        npx create-next-app@latest . --typescript --tailwind --eslint --app --src-dir --import-alias "@/*"
        print_success "Next.js project created!"
        ;;
esac

# Create additional configuration files
if [ "$PROJECT_TEMPLATE" != "rules-only" ]; then
    cat > .eslintrc.json << 'EOF'
{
  "extends": [
    "eslint:recommended",
    "@typescript-eslint/recommended",
    "plugin:react/recommended",
    "plugin:react-hooks/recommended",
    "prettier"
  ],
  "parser": "@typescript-eslint/parser",
  "plugins": ["@typescript-eslint", "react", "react-hooks"],
  "rules": {
    "react/react-in-jsx-scope": "off",
    "@typescript-eslint/no-unused-vars": "error",
    "@typescript-eslint/no-explicit-any": "warn"
  },
  "settings": {
    "react": {
      "version": "detect"
    }
  }
}
EOF

    cat > .prettierrc << 'EOF'
{
  "semi": true,
  "trailingComma": "es5",
  "singleQuote": true,
  "printWidth": 80,
  "tabWidth": 2
}
EOF

    cat > .gitignore << 'EOF'
# Dependencies
node_modules/
.pnp
.pnp.js

# Testing
coverage/
.nyc_output

# Production
build/
dist/

# Environment variables
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# Logs
npm-debug.log*
yarn-debug.log*
yarn-error.log*
lerna-debug.log*

# Runtime data
pids
*.pid
*.seed
*.pid.lock

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Temporary folders
tmp/
temp/

# Playwright
test-results/
playwright-report/
playwright/.cache/
EOF

    print_success "Configuration files created!"
fi

# Rename directory if needed
if [ "$RENAME_NEEDED" = true ]; then
    print_status "Renaming directory to $PROJECT_NAME..."
    cd ..
    if [ -d "$PROJECT_NAME" ]; then
        print_error "Directory $PROJECT_NAME already exists. Please choose a different name or remove the existing directory."
        exit 1
    fi
    mv "web-dev-cursor-bootstrap" "$PROJECT_NAME"
    cd "$PROJECT_NAME"
    print_success "Directory renamed to $PROJECT_NAME"
fi

# Clean up bootstrap-specific files
print_status "Cleaning up bootstrap-specific files..."
rm -f BOOTSTRAP_SUMMARY.md
rm -rf .cursor/mcp-configs
print_success "Cleanup complete"

# Final instructions
echo ""
echo "🎉 Setup Complete!"
echo "=================="
echo ""
print_success "Your web development project '$PROJECT_NAME' with Cursor AI agents is ready!"
echo ""
echo "Next steps:"
if [ "$PROJECT_TEMPLATE" != "rules-only" ]; then
    if [ "$RENAME_NEEDED" = true ]; then
        echo "1. cd $PROJECT_NAME"
        echo "2. Install dependencies: npm install"
        echo "3. Start development server: npm run dev"
        echo "4. Open the project in Cursor IDE"
        echo "5. Start coding with AI agents! 🤖"
    else
        echo "1. Install dependencies: npm install"
        echo "2. Start development server: npm run dev"
        echo "3. Open the project in Cursor IDE"
        echo "4. Start coding with AI agents! 🤖"
    fi
else
    echo "1. Open your project in Cursor IDE"
    echo "2. The AI agents are now configured and ready to use! 🤖"
fi
echo ""
echo "Available AI Agents:"
echo "🎨 UI/UX Designer - Design systems and user experience"
echo "⚛️ Frontend Developer - React components and TypeScript"
echo "🔧 Backend Developer - APIs and server-side logic"
echo "🧪 QA/Testing - Test automation and quality assurance"
echo "🚀 DevOps - CI/CD and deployment"
echo "📋 Project Manager - Planning and coordination"
echo ""
echo "Cost-optimized for Cursor Business ($40/month + ~$10-20 usage)"
echo ""
print_success "Happy coding! 🚀" 