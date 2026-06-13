# SmartTriage Frontend

SmartTriage Frontend is the customer-facing and agent-facing interface for the SmartTriage support ticket system. It provides a simple ticket submission form for users and a dashboard for agents to review, prioritize, and update tickets.

## Overview

This app is built with Next.js and TypeScript, using a modern UI stack with Tailwind CSS and shadcn-style components. It connects to the SmartTriage API to:

- submit new support tickets from the public page
- authenticate agents via the login page
- view and manage tickets in the dashboard

## Features

- Public support ticket submission form
- Agent login flow for secure access
- Ticket dashboard with status, priority, and pagination
- Ticket detail dialog for quick review
- Responsive UI for desktop and mobile use

## Project Structure

- src/app/ - main application pages and routes
  - / - ticket submission page
  - /login - agent login page
  - /dashboard - ticket management dashboard
- src/components/ - reusable UI and dialog components
- src/lib/ - API helpers, types, and utility functions

## Prerequisites

- Node.js 18 or newer
- npm (or your preferred package manager)

## Getting Started

1. Install dependencies:

   npm install

2. Create a local environment file if needed:

   NEXT_PUBLIC_API_URL=http://localhost:5000/api

   Adjust the URL to match your backend service.

3. Start the development server:

   npm run dev

4. Open the app in your browser:

   http://localhost:3000

## Available Scripts

- npm run dev - start the local development server
- npm run build - create a production build
- npm run start - start the production build locally
- npm run lint - run ESLint checks

## Environment Variables

The frontend uses the following public environment variable:

- NEXT_PUBLIC_API_URL - base URL for the SmartTriage API

If this value is not set, the app falls back to /api.

## Deployment

This project is configured for static export in Next.js with the output set to export. The included Dockerfile and Nginx setup are intended for containerized deployment.

## Notes

- The dashboard expects the agent session cookie named triage_session.
- Ticket updates and ticket list calls depend on the backend API being reachable from the configured API URL.
