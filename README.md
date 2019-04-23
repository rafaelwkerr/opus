# Opus

## Opus is an open source platform to running, schedulle and monitoring long-running background jobs.

[![](https://github.com/rafaelwkerr/my-files/blob/master/elixir_and_phoenix_and_redis.png)](https://github.com/rafaelwkerr/my-files/blob/master/elixir_and_phoenix_and_redis.png)

Opus is made with Phoenix, an Elixir web framework, and Redis, to Message Queue and PubSub services


Before start the Opus platform, you'll need a Redix server running, you can configure Redis on this elixir script file:

`/config/config.exs`

```erlang
config :exq,
  name: Exq,
  host: "172.17.0.2",
  port: 6379,
```

### Exq? What is?

Exq (Elixir queue) is a job processing library that uses Redis as a store for background processing jobs.

**Github:**
https://github.com/akira/exq


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
