# syntax=docker/dockerfile:1

# ---- Stage 1: deps ----
# Install dependencies only when needed, cached separately from source.
FROM node:20-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci

# ---- Stage 2: build ----
# Build the Next.js app. Requires `output: 'standalone'` in next.config.js.
FROM node:20-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run build

# ---- Stage 3: runtime ----
# Minimal production image running the standalone server as a non-root user.
FROM node:20-alpine AS runner
WORKDIR /app

ENV NODE_ENV=production
# Disable Next.js telemetry in the container
ENV NEXT_TELEMETRY_DISABLED=1

# Create a non-root user to run the app
RUN addgroup -S app && adduser -S app -G app

# Copy the standalone output, static assets, and public files
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static

USER app

EXPOSE 3000
ENV PORT=3000
ENV HOSTNAME=0.0.0.0

CMD ["node", "server.js"]