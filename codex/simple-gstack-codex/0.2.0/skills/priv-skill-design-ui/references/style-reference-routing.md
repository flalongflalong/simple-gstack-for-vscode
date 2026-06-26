# Style Reference Routing

This reference distills how to use `awesome-design-md`-style libraries. If `.tmp/awesome-design-md` exists, read only the README plus the 1-3 relevant `design-md/*/DESIGN.md` files for the current surface.

## DESIGN.md Pattern

A useful reference DESIGN.md usually contains:

- visual theme and atmosphere
- color palette with semantic roles
- typography roles
- component styling
- layout principles
- depth and elevation
- do/don't rules
- responsive behavior
- agent prompt guidance

Extract these sections as reusable rules. Do not copy the source product's brand identity.

## Reference Archetypes

- Developer platform: Vercel, Supabase, Railway-like, Resend, HashiCorp, Mintlify. Use for APIs, infra, SDKs, docs, CLIs, and technical products.
- Product operations app: Linear, Airtable, Superhuman, Raycast, Slack. Use for dashboards, project tools, workflows, internal SaaS, and repeat-use apps.
- AI creative/productivity: Claude, Cursor, Runway, ElevenLabs, Mistral, Together, Replicate. Use for AI assistants, prompt tools, generation workflows, model dashboards, and creative automation.
- Data/backend/database: ClickHouse, MongoDB, Supabase, Sentry, PostHog. Use for observability, analytics, database consoles, monitoring, and admin tools.
- Docs/content system: Mintlify, Notion, Sanity, Webflow. Use for knowledge bases, CMS, docs portals, help centers, and content-heavy product surfaces.
- Commerce/marketplace: Shopify, Airbnb, Nike, Starbucks. Use for listings, checkout, catalog, venue/product browsing, and consumer trust flows.
- Finance/trust: Stripe, Wise, Coinbase, Binance, Kraken, Mastercard. Use for payments, ledgers, pricing, risk, identity, compliance, and high-trust transactional UI.
- Editorial/media: The Verge, Wired, Pinterest, Spotify. Use for feeds, collections, publications, music/media browsing, and visual discovery.
- Premium object/automotive: Apple, BMW, Ferrari, Lamborghini, Tesla, Bugatti. Use sparingly for product showcases, hardware, high-end portfolios, and brand-forward launches.
- Retro/nostalgic: Dell 1996, HP, Nintendo 2001. Use only when nostalgia is part of the product concept or prototype brief.

## Selection Rules

1. Match by user task and content density before palette.
2. Choose one primary archetype and at most two accents.
3. Translate references into project-owned tokens and component rules.
4. If the repo already has `DESIGN.md`, use references to fill gaps instead of replacing the system.
5. For enterprise/internal tools, bias toward product-operations and data/backend archetypes.
6. For public product sites, combine category-legible structure with one distinctive visual anchor.

## Style Brief Checklist

- Does the direction explain what the user should feel in the first 3 seconds?
- Are color roles semantic rather than just a list of hex values?
- Are typography rules tied to hierarchy and density?
- Are components described with hover/focus/disabled/error states?
- Is the layout model clear for desktop and mobile?
- Are anti-patterns named so future AI-generated UI has guardrails?
- Is there a clear handoff to implementation, design consultation, or review?
