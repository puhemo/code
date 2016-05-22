FROM ruby:2.1
#FROM alpine:3.3
#FROM envygeeks/alpine
MAINTAINER digitaldrummerj@gmail.com

RUN apt-get update \
  && apt-get install -y \
    python-pygments \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

#RUN    cd ~ && \
#    yes | gem update --system --no-document -- --use-system-libraries && \
#    yes | gem update --no-document -- --use-system-libraries 

# gem install nokogiri -- --use-system-libraries && \
RUN gem clean && \
    gem install github-pages && \
    gem install bundler
  

RUN rm -rf /usr/lib/ruby/gems/*/cache/*.gem && \
    rm -rf /var/cache/apk/*

VOLUME /src
EXPOSE 4000

WORKDIR /src 
#ENTRYPOINT ["bundle exec jekyll"]
