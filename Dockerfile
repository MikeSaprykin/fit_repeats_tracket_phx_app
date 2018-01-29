# base image elixer to start with
FROM elixir:latest

MAINTAINER Mike Saprykin mikesaprykin@gmail.com

# install hex package manager
RUN mix local.hex --force

# install the latest phoenix 
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez --force

## install node
RUN curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install nodejs

# create app folder
RUN mkdir /app  
COPY . /app  
WORKDIR /app

# install dependencies
RUN mix deps.get

# install node dependencies
WORKDIR /app/assets
RUN npm install
RUN node node_modules/brunch/bin/brunch build
WORKDIR /app

CMD mix phx.server