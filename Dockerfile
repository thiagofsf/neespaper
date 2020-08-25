FROM jekyll/jekyll:4.0

RUN apk add --no-cache --virtual .build-deps \
        autoconf \
        libtool \
        nasm \
        automake

WORKDIR /srv/jekyll
COPY Gemfile Gemfile.lock ./

RUN bundle install --jobs 20 --retry 5

CMD bundle exec jekyll build