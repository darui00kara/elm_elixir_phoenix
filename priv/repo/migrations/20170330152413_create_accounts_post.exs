defmodule ElmElixirPhx.Repo.Migrations.CreateElmElixirPhx.Accounts.Post do
  use Ecto.Migration

  def change do
    create table(:accounts_posts) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end
