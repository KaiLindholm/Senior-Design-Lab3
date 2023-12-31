ARG BASE_IMG=ruby:2.6.6
ARG GEM_CACHE=${BASE_IMG}

# if a gem-cache image is specified, copy the gems from it
FROM $GEM_CACHE as gem-cache 
RUN mkdir -p /usr/local/bundle 

# plaform linux/x86_64 is required by heroku
FROM --platform=linux/x86_64 $BASE_IMG as base
ENV BUNDLER_VERSION=1.17.3

# update image and install dependencies
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    nodejs
    
RUN gem install bundler --no-document -v ${BUNDLER_VERSION}
WORKDIR /usr/src/app

# Copy gems from a gem-cache build stage if specified, otherwise install them
FROM base AS gems
COPY --from=gem-cache /usr/local/bundle /usr/local/bundle
COPY Gemfile* ./
# ensure we're using the correct platform

RUN bundle config force_ruby_platform true  

RUN bundle install --jobs 5 --retry 5

# Copy the app and migrate the database
FROM base AS deploy
COPY --from=gems /usr/local/bundle /usr/local/bundle
COPY . .

RUN bundle exec rake assets:precompile

# CMD bundle exec puma -C config/puma.rb
RUN useradd -ms /bin/bash app
USER app

EXPOSE $PORT
