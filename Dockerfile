FROM elixir:1.8.1

WORKDIR /app
ADD .  /app

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - &&\
    apt install npm &&\
    mix local.hex --force &&\
    mix local.rebar --force &&\
    mix deps.get &&\
    cd assets && npm install

CMD ["mix", "phx.server"]
