# Style Guide – Joseph Bahous Landing Page (v2)

## 🎨 Color Palette
- **Light Blue:** #b9d6f2 (backgrounds, highlights)
- **Navy:** #061a40 (primary backgrounds, header/footer, text)
- **Royal Blue:** #0353a4 (primary buttons, links, accents)
- **Sky Blue:** #006daa (secondary buttons, hover states)
- **Deep Blue:** #003559 (headings, strong accents, dividers)

### Color Usage
| Color Name   | HEX      | Usage Example                        |
|-------------|----------|--------------------------------------|
| Light Blue  | #b9d6f2  | Section backgrounds, cards           |
| Navy        | #061a40  | Header/footer, main text, nav        |
| Royal Blue  | #0353a4  | Primary CTA, links, icons            |
| Sky Blue    | #006daa  | Button hover, secondary accents      |
| Deep Blue   | #003559  | Headings, dividers, strong elements  |

## 🅰️ Typography
- **Headings:** 'Segoe UI', Arial, sans-serif; bold, uppercase for main headings
- **Body:** 'Segoe UI', Arial, sans-serif; regular weight
- **Font Colors:**
  - Headings: #003559 or #061a40
  - Body: #061a40
  - Links/CTA: #0353a4

## 🔘 Buttons
- **Primary CTA:**
  - Background: #0353a4
  - Text: #fff
  - Border-radius: 999px
  - Hover: background #006daa
- **Secondary:**
  - Background: #b9d6f2
  - Text: #0353a4
  - Border: 1px solid #0353a4
  - Hover: background #0353a4, text #fff

## 🖼️ Backgrounds & Cards
- Use #b9d6f2 for section backgrounds and cards
- Use #061a40 for header/footer
- Use white (#fff) for main content background for contrast

## 📏 Spacing & Layout
- Consistent padding/margin (1.5–2rem for sections)
- Cards and sections have rounded corners (8px)
- Use clear dividers (#003559, 1px solid) between major sections

## 🔗 Links
- Color: #0353a4
- Hover: underline, color #006daa

## 🦾 Accessibility
- Ensure color contrast: all text on blue backgrounds must meet WCAG AA
- All buttons and links must have visible focus states (outline: 2px solid #b9d6f2 or #0353a4)
- Font size: minimum 1rem for body, 1.5rem+ for headings

## 🖥️ Example Usage
```html
<header style="background:#061a40; color:#fff;">
  <nav><a style="color:#b9d6f2;">Home</a></nav>
</header>
<main style="background:#fff; color:#061a40;">
  <h1 style="color:#003559;">Connecting Capital with Innovation</h1>
  <a class="cta-btn" style="background:#0353a4; color:#fff;">Book a Chat</a>
</main>
<section style="background:#b9d6f2;">
  <div class="card" style="background:#fff; border:1px solid #003559; border-radius:8px;">...</div>
</section>
```

---

**All design and development must follow this style guide for visual consistency and accessibility.**

## 🆕 2025 Hero Section Design Trends
- **Glossy Glassmorphism:** Frosted glass overlays, blur, subtle shadows, and glossy effects for a premium look.
- **Animated Backgrounds:** Subtle animated gradients, morphing shapes, or video loops for depth and energy.
- **Full-Width, Immersive Layout:** Hero spans the entire viewport for maximum impact.
- **Bold, Animated Typography:** Oversized, expressive headlines, possibly animated or interactive.
- **3D/Parallax Elements:** Layered graphics or parallax scrolling for depth.
- **AI-Enhanced/Abstract Imagery:** Use AI-generated or abstracted versions of Joseph's photo for a unique touch.
- **Minimal, Clean Design:** Negative space, clear hierarchy, minimal distractions.
- **Accessibility & Responsiveness:** All effects must be performant, accessible, and mobile-friendly.

## 📐 Annotated Wireframes (2025 Hero)

### Desktop
```
+-------------------------------------------------------------+
| [Header: #061a40, text #fff]                               |
| Joseph Bahous        Home | About | Book a Chat | Contact   |
+-------------------------------------------------------------+
| [Hero: full-viewport, animated bg, glassmorphism overlay]  |
|   [ AI/abstract Joseph image, left or center ]             |
|   [ H1: #003559, bold, animated ]                          |
|   [ Subheadline: #061a40, large ]                          |
|   [ Primary CTA: #0353a4 bg, #fff text, glassy card ]      |
|   [ Floating icons, 3D/parallax shapes, subtle motion ]     |
+-------------------------------------------------------------+
```

### Mobile
```
+-------------------------------+
| [Header: #061a40, text #fff]  |
| [Hamburger menu]              |
+-------------------------------+
| [Hero: full-viewport,         |
|  animated bg, glass overlay]  |
| [AI/abstract Joseph image]    |
| [H1: bold, animated]          |
| [Subheadline]                 |
| [CTA: glassy button]          |
| [Floating icons/effects]      |
+-------------------------------+
```

## Implementation Notes
- Use the color palette for gradients, overlays, and accents.
- Glassmorphism: CSS backdrop-filter, blur, semi-transparent backgrounds.
- Animated backgrounds: CSS/SVG/Canvas or lightweight video.
- Typography: Animate with CSS or JS for smooth transitions.
- 3D/parallax: Use SVG, CSS transforms, or libraries if needed.
- Ensure all effects are accessible and degrade gracefully on mobile. 