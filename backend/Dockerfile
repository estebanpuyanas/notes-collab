FROM elixir:1.18.3-alpine AS build

# install build dependencies
RUN apk add --no-cache build-base npm git

# set working dir
WORKDIR /app

# Copy mix files only, install Hex/Rebar, fetch deps
COPY mix.exs mix.lock ./

# Install Hex & Rebar non-interactively
RUN mix local.hex --force \
    && mix local.rebar --force

# Now fetch and compile deps
RUN mix deps.get \
    && mix deps.compile

# Copy the rest of your source
COPY . .

# Compile your app
RUN mix compile
