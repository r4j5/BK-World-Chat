# BK World Chat 👑

A black-and-purple, text-only global chat community starter.

## Included
- Responsive BK World Chat landing page
- Six room choices: Pakistan, India, UK, USA, Friendship, International
- Supabase SQL starter schema with Row Level Security
- No voice or video calling features

## Important status
The current frontend is a **design preview**, not a functioning social network yet. Account registration and live messaging are intentionally disabled until the owner configures Supabase credentials and applies the database schema. Do not advertise this as live chat until that integration is complete and tested.

## Supabase setup
1. In Supabase, open Project Settings → API.
2. Copy the Project URL and the publishable/anon key. Never use the service-role/secret key in browser code.
3. Run `supabase/schema.sql` in the Supabase SQL Editor.
4. Configure email authentication and email confirmation.
5. Implement and test signup, login, profile creation, room subscriptions, message sending, moderation/reporting, and abuse controls before enabling the chat UI.

## Free hosting
The repository includes a GitHub Actions Pages workflow. Enable GitHub Pages in repository Settings → Pages and select GitHub Actions as the deployment source. After the workflow succeeds, the site should be available at:
https://r4j5.github.io/BK-World-Chat/

GitHub Pages deployment and Supabase free-tier usage are subject to provider limits and terms.