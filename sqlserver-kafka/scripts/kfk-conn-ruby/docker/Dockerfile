FROM ruby:3.2.2-alpine3.18

# Install dependencies
RUN apk add --update --no-cache \
    build-base \
    libxml2-dev \
    libxslt-dev \
    bash \
    vim

WORKDIR /app

#COPY Gemfile Gemfile.lock ./
COPY Gemfile ./

RUN bundle install

COPY . .

#CMD ["ruby", "your_script.rb"]
#
LABEL application=kfk-conn-ruby
