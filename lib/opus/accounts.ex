defmodule Opus.Accounts do

  def create_user(user) do
    {:ok, conn} = Redix.start_link(host: "172.17.0.2", port: 6379)
    Redix.command(conn, ["HMSET", "users", user["email"], Comeonin.Bcrypt.hashpwsalt(user["password"])])
    nid = Nanoid.generate()
    {:ok, nid}
  end

end
