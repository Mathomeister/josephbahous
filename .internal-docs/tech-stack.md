# Technology Stack for josephbahous

## Overview
This document summarizes the core technologies, tools, and services used to build, deploy, and manage the josephbahous website. It also includes a budget summary for all major components.

---

## Frontend
- **HTML5:** Semantic, accessible markup for all pages
- **Tailwind CSS:** Utility-first CSS framework for rapid, responsive design
- **JavaScript (vanilla):** For interactivity (mobile menu, iframe loader, dark mode toggle, etc.)
- **SVG:** Custom animated backgrounds and icons

---

## Hosting & Deployment
- **GitHub Pages:** Current static site hosting solution (free, integrates with GitHub repo)
  - **Production deployment will use the client's GitHub account and repository.**
  - **Custom domain josephbahous.com is registered on GoDaddy and will be used for production.**
- **Netlify/Vercel:** Considered for future production (advanced CI/CD, serverless functions, analytics)
- **AWS S3 + CloudFront:** Option for enterprise-grade scalability (not currently used)

---

## Forms & Automation
- **Tally.so:** Embedded form for coffee chat applications
- **Zapier:** Automates workflow (Notion integration, applicant filtering, email notifications, error alerts)
- **Calendly:** Scheduling for qualified applicants

---

## Content Management & AI/LLM Access
- **Markdown (.md):** Planned for content authoring, version control, and optional public/AI access
- **Notion:** Database for form submissions, manual review, and reporting dashboard
- **Taskmaster:** AI-powered task/project management, planning, and documentation
- **GitHub:** Version control, repository management, and static site hosting (GitHub Pages)
- **Git:** Local version control

---

## Analytics & Monitoring
- **Google Analytics:** Integration pending (client is setting up GA4 account)
- **Search Console/Plausible:** (optional, not yet implemented)

---

## AI/Automation/DevOps
- **MCP (Model Context Protocol):** For advanced AI agent integration, research, browser automation, and cloud/deployment tools
- **Cursor Agents:** Specialized AI agents for design, development, QA, DevOps, and project management

---

## Other Tools & Libraries
- **Plausible/Google Analytics:** (Planned) for privacy-friendly analytics
- **Slack:** (Optional, for team communication if needed)
- **Google Drive:** (Optional, for document sharing if needed)

---

## Budget Summary

| Item                | Free Tier? | Paid Cost (if needed)         | Notes                                 |
|---------------------|:----------:|-------------------------------|---------------------------------------|
| Domain Name         |     —      | $10–$15/year (.com)           | Required for production               |
| GitHub Pages        |   Yes      | Free                          | Current hosting                       |
| Netlify/Vercel      |   Yes      | $20+/month (if over free)     | Optional, for advanced features       |
| AWS S3/CloudFront   |     —      | Pay-as-you-go                 | Optional, enterprise only             |
| Tally.so            |   Yes      | $29+/month (pro, optional)    | Free tier sufficient for now          |
| Zapier              |   Yes      | $20+/month (if over free)     | Free tier covers 100 tasks/month      |
| Calendly            |   Yes      | $8–$12/month (pro, optional)  | Free tier covers basic scheduling     |
| Notion              |   Yes      | $8/month/user (team, optional)| Free for personal use                 |
| Analytics           |   Yes      | $9+/month (Plausible, opt.)   | Google Analytics is free              |
| Email (custom)      |     —      | $6+/month (Google/Zoho, opt.) | Only if branded email is needed       |
| AI/Taskmaster/MCP   |   Yes      | Free (unless using premium AI)| Most dev tools are free               |

**Note:** All tools and services are currently used on their free tier. The only required cost for production is the domain name. Optional upgrades (analytics, advanced automation, branded email, premium AI) can be added as needed. 