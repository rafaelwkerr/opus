defmodule Opus.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :name, :string
      add :input, :integer
      add :status, :string

      timestamps()
    end

  end
end
