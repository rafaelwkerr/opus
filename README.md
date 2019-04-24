# Opus

### Opus is an open source platform to running, schedulle and monitoring long-running background jobs.
<br/>

[![](https://github.com/rafaelwkerr/my-files/blob/master/elixir_and_phoenix_and_redis.png)](https://github.com/rafaelwkerr/my-files/blob/master/elixir_and_phoenix_and_redis.png)

Opus is made with Phoenix, an Elixir web framework, and Redis, to Message Queue and PubSub services


Before start the Opus platform, you'll need a Redis server running. You can configurate Redis on elixir script file:

`/config/config.exs`

```
config :exq,
  name: Exq,
  host: "172.17.0.2",
  port: 6379,
```


## Exq? What is?

Exq (Elixir queue) is a job processing library that uses Redis as a store for background processing jobs.


**Github:**
https://github.com/akira/exq


## View and Manage Background Jobs in the Queue


``http://localhost:4000/exq/``

Exq has a UI to manage the jobs:


 
![](https://github.com/rafaelwkerr/my-files/blob/master/Screenshot%20from%202019-04-23%2019-08-40.png)

<br/>

------------

<br/>

## To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


![](https://github.com/rafaelwkerr/my-files/blob/master/Screenshot%20from%202019-04-23%2019-20-52.png)


Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
