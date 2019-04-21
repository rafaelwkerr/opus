defmodule OpusWeb.UserView do
  use OpusWeb, :view
  alias OpusWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("post.json", %{user: token}) do
    %{token: token.value}
  end

end
