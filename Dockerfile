FROM ruby:3.3-slim AS base

WORKDIR /usr/src/app
RUN bundle config --global frozen 1; \
    bundle config --global path /usr/src/bundle
COPY Gemfile Gemfile.lock ./

FROM base AS build
RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
        build-essential; \
	rm -rf /var/lib/apt/lists/*
RUN bundle install

FROM base
COPY --from=build /usr/src/bundle /usr/src/bundle
COPY . .

EXPOSE 4000
CMD ["bin/jekyll", "serve", "--host", "0.0.0.0", "--port", "4000"]
