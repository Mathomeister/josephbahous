# Joseph Bahous – Personal Website

A professional, static website for Joseph Bahous, Investment Director at Quantacet, Montréal. The site presents Joseph's background, offers mentorship and career guidance, and provides a way to book a chat via Calendly.

---

## 🌟 Project Overview

- **Type:** Static website (HTML, CSS, minimal JS)
- **Purpose:** Personal/professional profile, mentorship offering, and contact point
- **Design:** Clean, professional, responsive
- **Booking:** Calendly integration for scheduling chats

---

## 👤 Joseph Bahous – Professional Profile & Online Presence

- **Current Role:** Investment Director at [Quantacet](https://www.quantacet.com/en/team/), Canada's first quantum-focused venture capital fund (Montréal)
- **Background:** Extensive experience in investment since 2016, covering public and private investments, with a focus on pre-seed and seed Canadian companies (notably in digital health and quantum tech)
- **Previous Roles:** Investment Director at MEDTEQ+, Analyst at National Bank Financial, Investment Representative at TD
- **Education:** Diploma of Specialized Higher Studies in Financial Professions (Finance) and Bachelor's in Finance from HEC Montréal; completed Canadian Securities Institute certifications; CFA principles expertise
- **Expertise:** Portfolio management, financial analysis, strategic investment, client relationships, market analysis, compliance, and risk management
- **Professional Impact:** Exceeded investment targets, strong portfolio performance, active in industry events, mentoring
- **LinkedIn:** [joseph-bahous-cfa-337196b3](https://www.linkedin.com/in/joseph-bahous-cfa-337196b3)
- **Quantacet Profile:** [quantacet.com/en/team/](https://www.quantacet.com/en/team/)

**References:**
- [Quantacet Team Page](https://www.quantacet.com/en/team/)
- [Quantacet Home](https://www.quantacet.com/en/)
- [SuperAGI Research Profile](https://sales.superagi.com/contact/joseph-bahous)
- [LinkedIn Profile](https://www.linkedin.com/in/joseph-bahous-cfa-337196b3)

---

## 📝 Design Thinking & Wireframe Rationale

- **Goal:** Maximize conversion by making it easy for visitors to understand Joseph's value and book a chat.
- **Above the Fold:** Headline, subheadline, and a single prominent CTA ("Book a Chat") are placed at the top for immediate clarity and action.
- **Trust Signals:** Credentials, affiliations, and testimonials (if available) are displayed just below the hero section to build credibility.
- **Minimal Navigation:** Only essential links (Home, About, Book a Chat, Contact) to reduce distraction and keep focus on the CTA.
- **About & Contact:** Short bio and contact info are included for transparency and accessibility.
- **Visual Hierarchy:** Headline and CTA are most prominent, followed by trust signals and supporting info.
- **Mobile-First:** Navigation collapses to a hamburger menu; sections stack vertically for readability and usability on small screens.
- **Accessibility & Performance:** Semantic HTML, high contrast, keyboard navigation, and optimized assets are prioritized.

---

## 📁 Structure

```
web-dev-cursor-bootstrap/
├── docs/                # Project documentation and briefs
├── scripts/             # (Optional) Utility scripts
├── templates/           # (Optional) HTML/CSS templates
├── README.md            # This file
```

---

## 🗺️ Site Pages

- **Home:** Brief intro, call-to-action to book a chat
- **About:** Bio, experience, philosophy
- **Book a Chat:** Embedded Calendly scheduler
- **Contact:** Email, LinkedIn, optional events/talks

---

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone <your-repo-url>
   ```
2. Open the project in your code editor.
3. Edit content in the HTML/CSS files as needed (to be added in `/templates` or root).
4. Deploy to your preferred static hosting (GitHub Pages, Netlify, Vercel, etc.).

---

## ✉️ Contact

- **Email:** j.j.bahous@gmail.com
- **LinkedIn:** [Insert LinkedIn link]

---

## 📄 License

MIT License

## Project Overview
This is a modern, responsive landing page for Joseph Bahous, Investment Director, built with Tailwind CSS. The design and implementation process focused on clean UI, accessibility, and a strong brand presence.

## Design & Development Process
- **Tailwind CSS via CDN**: Chosen for rapid prototyping and easy dark mode support.
- **Modern UI**: Inspired by Tailwind UI templates (Spotlight, Simple Centered, Side-by-side Contact, etc.).
- **Navigation**: Glassmorphic menu, mobile modal, and smooth scrolling.
- **Dark/Light Mode**: Toggle with persistent preference, using a custom brand color (`#003559`) for dark mode and as the main accent in light mode.
- **Color Palette**: All accents and icons use the brand color for consistency.
- **Content Structure**: Hero, credentials, about, testimonial, CTA, FAQ, and contact sections, all modular and easy to update.
- **Accessibility**: ARIA labels, keyboard navigation, color contrast, and accessible SVGs.
- **Responsiveness**: Fully mobile-friendly, with grid layouts adapting to all screen sizes.
- **QA**: Manual and automated checks for navigation, dark mode, responsiveness, and accessibility.

## What Remains Before Deployment
- Final QA pass (cross-browser, mobile, accessibility)
- Add favicon and meta tags for SEO
- (Optional) Add analytics (e.g., Plausible, Google Analytics)
- Set up custom domain (if needed)
- Deploy to GitHub Pages (see below)

## Local Preview
Open `templates/landing-page.html` in your browser. No build step is required.

## Planned Deployment
The site will be deployed using GitHub Pages for easy client review and sharing. See below for DevOps instructions.

## Deployment (DevOps)

This project can be deployed using **GitHub Pages**:

1. Move or copy `templates/landing-page.html` to the repository root as `index.html`, or to a `docs/` folder as `docs/index.html`.
2. Go to your repository's **Settings > Pages**.
3. Set the source to the root or `/docs` folder (wherever you placed the HTML file).
4. Save. GitHub will publish your site at `https://<username>.github.io/<repo>/`.

This is ideal for static sites and allows easy sharing with the client. 