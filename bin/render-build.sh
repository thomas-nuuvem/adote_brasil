#!/usr/bin/env bash
# exit on error
set -o errexit

# Install dependencies
bundle install

# Install JavaScript dependencies and build assets
yarn install --frozen-lockfile
yarn build
yarn build:css

# Precompile assets
bundle exec rails assets:precompile

# Run database migrations
bundle exec rails db:migrate

# Seed the database (optional - comment out if you don't want seeds in production)
bundle exec rails db:seed
