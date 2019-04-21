defmodule Opus.Accounts do
  @moduledoc """
  The Accounts context.
  """

  alias Opus.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    #Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  #def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(user) do
    {:ok, conn} = Redix.start_link(host: "172.17.0.2", port: 6379)
    Redix.command(conn, ["SET", user["email"], user["password"]])
    nid = Nanoid.generate()
    {:ok, nid}
  end

  def get_user(email) do
    {:ok, conn} = Redix.start_link(host: "172.17.0.2", port: 6379)
    Redix.command(conn, ["GET", email])
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}


  def update_user(%User{} = user, attrs) do
    #user
    #|> User.changeset(attrs)
    #|> Repo.update()
  end
  """

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}


  def delete_user(%User{} = user) do
    #Repo.delete(user)
  end
  """

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}


  def change_user(%User{} = user) do
   # User.changeset(user, %{})
  end
  """
end
