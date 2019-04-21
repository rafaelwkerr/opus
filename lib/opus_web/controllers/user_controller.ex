defmodule OpusWeb.UserController do
  use OpusWeb, :controller

  alias Opus.Accounts
  alias Opus.Guardian

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, id} <- Accounts.create_user(user_params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(id) do

      #IO.puts(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
      #IO.inspect Guardian.encode_and_sign(id)
      #IO.puts(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")

      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, token))
      |> render("post.json", user: %{value: token})
    end
    render(conn, "post.json", user: %{value: "deu ruim aqui"})
  end

end
