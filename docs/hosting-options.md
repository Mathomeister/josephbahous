# Static Site Hosting Options for josephbahous

## Overview
This document summarizes the main hosting options for the josephbahous website, focusing on static site solutions suitable for students and young professionals. It includes a pros/cons matrix and recommendations for both current and future production needs.

---

## Hosting Options Compared

| Provider                | Pros                                                                 | Cons                                                                |
|-------------------------|----------------------------------------------------------------------|---------------------------------------------------------------------|
| **GitHub Pages**        | - Free for public repos<br>- Easy setup<br>- Custom domain & SSL<br>- Integrates with GitHub Actions<br>- Great for static sites<br>- Public .md files easy to serve | - No serverless functions<br>- Limited build customization<br>- No built-in analytics<br>- Slower global CDN than others |
| **Netlify**             | - Free tier<br>- Easy CI/CD<br>- Custom domain & SSL<br>- Serverless functions<br>- Instant rollbacks<br>- Built-in analytics<br>- Fast CDN<br>- Supports static & JAMstack | - Free tier has usage limits<br>- Slightly more complex than GH Pages<br>- Some features paid only |
| **Vercel**              | - Free tier<br>- Easy CI/CD<br>- Custom domain & SSL<br>- Serverless functions<br>- Fast CDN<br>- Great for Next.js/React<br>- Instant rollbacks | - Free tier has usage limits<br>- Some features paid only<br>- Slightly more complex than GH Pages |
| **AWS S3 + CloudFront** | - Enterprise-grade scalability<br>- Full control<br>- Fast global CDN<br>- Can serve static & dynamic<br>- Pay-as-you-go | - Complex setup<br>- Requires AWS knowledge<br>- Manual SSL/CDN config<br>- No built-in CI/CD<br>- Not free |

---

## Recommendations

- **Current (Development/Preview):**
  - GitHub Pages is ideal for static content, public .md files, and simple workflows.
  - Easy to set up, free, and integrates with your existing GitHub repo.

- **Production (Final Domain):**
  - If you need advanced features (serverless functions, analytics, instant rollbacks), consider Netlify or Vercel.
  - Both support custom domains, SSL, and easy migration from GitHub.
  - AWS S3 + CloudFront is best for enterprise needs but is more complex.

- **Publishing Markdown:**
  - GitHub is ideal for making .md files public (for AI/LLM access).
  - Netlify/Vercel can also serve .md files if included in the build output.

---

## Next Steps
- Continue using GitHub Pages for now.
- Revisit hosting when ready for production and after purchasing the final domain.
- Document DNS and deployment steps for a smooth migration if needed.

---

## Domain Name Options

### Recommended Registrars
- **Google Domains (Squarespace):** User-friendly, good DNS, privacy included
- **Namecheap:** Affordable, free WHOIS privacy, easy DNS
- **GoDaddy:** Large provider, frequent discounts, but upsells and privacy may cost extra
- **Hover:** Simple, privacy included, no upsells
- **Cloudflare Registrar:** At-cost pricing, excellent DNS, limited TLDs

### TLD Choices
- **.com:** Most trusted and credible
- **.org, .net:** Good alternatives
- **.io, .co, .ai:** Popular with tech/startup audiences
- **Country-specific (.ca, .us, etc.):** For regional targeting

### Key Considerations
- **Availability:** Use registrar search tools to check if your preferred name is available
- **Branding:** Short, memorable, easy to spell
- **Privacy:** Choose a registrar with free WHOIS privacy
- **DNS Management:** Good DNS tools make setup and changes easier
- **Email:** Some registrars offer bundled email, or use Google Workspace/Zoho

### Setup Steps
1. Brainstorm and check availability for preferred names (e.g., josephbahous.com)
2. Register the domain with privacy protection
3. Set up DNS to point to your chosen host (GitHub Pages, Netlify, etc.)
4. Configure SSL (most hosts provide this for free)
5. Document DNS and deployment steps for future reference

### Typical Cost
- .com: $10–$15/year
- .io, .ai: $30–$80/year
- Privacy should be free

---

**Current Usage Note:**
All hosting, forms, automation, scheduling, and project management tools described above are currently used on their free tier. No recurring costs are incurred at this stage except for the domain name (when purchased).

## Current Status
- **Domain:** josephbahous.com is registered on GoDaddy (production domain)
- **GitHub:** Production repo created on Joseph Bahous's account ([repo link](https://github.com/Joseph-Bahous/josehbahous.com)); you are a collaborator
- **Deployment:** Dual-repo process in place (see below)
- **Google Analytics:** Integration pending (client is setting up GA4 account)

---

## Deployment Process: Dual GitHub Repos

### Updated Steps
1. Prepare production-ready code in your (dev) repo
2. Add the client repo as a remote
3. Push only the main branch to the client repo (no feature/dev/docs branches)
4. Enable GitHub Pages in the client repo (Settings → Pages)
5. Set the custom domain to josephbahous.com
6. Configure DNS on GoDaddy (A records for apex, CNAME for www)
7. Wait for DNS propagation
8. Enforce HTTPS in Pages settings
9. Test the live site at https://josephbahous.com and https://www.josephbahous.com
10. Public .md files in the production repo should only contain website content (for AI/SEO)

- Reference: [GitHub Docs – Managing a custom domain for your GitHub Pages site](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site)

### Optional: Automated Deployment (GitHub Actions)
- Set up a GitHub Action in your repo to build and push to the client repo on release/tag.
- This can fully automate steps 3–6 above.

### Branch and Documentation Control
- Only push the main (production) branch to the public repo on Joseph Bahous's account.
- Do NOT push feature, dev, or docs branches to the public repo.
- Internal documentation must remain in your private development repo.
- Public .md files in the production repo should only contain content from public website pages (for AI/SEO).

### Best Practices
- Keep the client repo clean: only production-ready code.
- Only the main branch should exist in the public repo; do not push other branches.
- Document the sync process in `DEPLOYMENT.md`.
- Use branch protection and PR review on the client repo if desired.
- Always verify the live site after deployment.

### Summary
- All development happens in your repo.
- Production repo is updated only for releases, and only the main branch is public.
- No internal docs or feature branches are ever pushed to the public repo.
- Public .md files are limited to public website content for AI/SEO.
- Deployment is controlled, auditable, and easy to automate. 