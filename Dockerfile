FROM alpine:3.3
#FROM envygeeks/alpine
MAINTAINER digitaldrummerj@gmail.com

# ENV EXT_PACKAGES  
# ENV BUILD_PACKAGES 
# ENV RUBY_PACKAGES  
# ENV JEKYLL_PACAKGES 

 #RUN apk --update add ruby-irb ruby-rake ruby-bigdecimal ruby-bundler libstdc++ tzdata
# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk update && \
    apk upgrade && \
    apk --update add nodejs git && \
    apk --update add readline readline-dev libxml2 libxml2-dev libxslt libxslt-dev zlib zlib-dev bash curl-dev ruby-dev build-base libffi libffi-dev yaml yaml-dev  && \
    apk --update add ruby ruby-io-console ruby-bundler ruby-irb ruby-json ruby-rake ruby-rdoc && \
    apk --update add py-pip  
    
RUN    cd ~ && \
    yes | gem update --system --no-document -- --use-system-libraries && \
    yes | gem update --no-document -- --use-system-libraries 

RUN     gem install nokogiri -- --use-system-libraries && \
    gem clean 
 
RUN gem install bundler github-pages jekyll-redirect-from --no-document 

RUN rm -rf /usr/lib/ruby/gems/*/cache/*.gem && \
    rm -rf /var/cache/apk/*

VOLUME /src
EXPOSE 4000

WORKDIR /src
#RUN bundle install

#WORKDIR /src
#ENTRYPOINT ["bundle exec jekyll serve  -H 0.0.0.0 --config _config.yml,_configdev.yml --drafts"]