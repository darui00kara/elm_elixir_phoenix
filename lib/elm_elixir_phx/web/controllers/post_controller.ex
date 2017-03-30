defmodule ElmElixirPhx.Web.PostController do
  use ElmElixirPhx.Web, :controller

  alias ElmElixirPhx.Accounts
  alias ElmElixirPhx.Accounts.Post

  action_fallback ElmElixirPhx.Web.FallbackController

  def index(conn, _params) do
    posts = Accounts.list_posts()
    render(conn, "index.json", posts: posts)
  end

  def create(conn, %{"post" => post_params}) do
    with {:ok, %Post{} = post} <- Accounts.create_post(post_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", post_path(conn, :show, post))
      |> render("show.json", post: post)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Accounts.get_post!(id)
    render(conn, "show.json", post: post)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Accounts.get_post!(id)

    with {:ok, %Post{} = post} <- Accounts.update_post(post, post_params) do
      render(conn, "show.json", post: post)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Accounts.get_post!(id)
    with {:ok, %Post{}} <- Accounts.delete_post(post) do
      send_resp(conn, :no_content, "")
    end
  end
end
