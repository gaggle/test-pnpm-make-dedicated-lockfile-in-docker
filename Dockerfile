FROM node:16-alpine AS base
ARG PNPM_VERSION=6.17.0
RUN npm --no-update-notifier --no-fund --global install pnpm@${PNPM_VERSION}
COPY . .
RUN pnpm install --frozen-lockfile
RUN pnpm exec make-dedicated-lockfile
