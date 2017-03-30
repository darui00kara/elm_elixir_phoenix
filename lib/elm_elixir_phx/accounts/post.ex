defmodule ElmElixirPhx.Accounts.Post do
  use Ecto.Schema

  schema "accounts_posts" do
    field :body, :string
    field :title, :string

    timestamps()
  end
end
