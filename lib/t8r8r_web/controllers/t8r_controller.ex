defmodule T8r8rWeb.T8rController do
  use T8r8rWeb, :controller

  alias T8r8r.T8rs
  alias T8r8r.T8rs.T8r

  def vote(conn, _params) do
    random_t8rs = T8rs.get_random_t8rs(2)

    case random_t8rs do
      [t8r_1, t8r_2] ->
        render(conn, "vote.html", t8r_1: t8r_1, t8r_2: t8r_2)

      _ ->
        t8r = T8rs.list_t8r()

        conn
        |> put_flash(:info, "Can't vote for some reason")
        |> render("index.html", t8r: t8r)
    end
  end

  def gr8(conn, _params) do
    topT8rs = T8rs.top(5)
    render(conn, "gr8.html", t8rs: topT8rs)
  end

  def about(conn, _params) do
    render(conn, "about.html")
  end

  def update_after_vote(conn, %{
        "id1" => id_1,
        "id2" => id_2,
        "winning_id" => winning_id
      }) do
    result = T8rs.update_from_vote(id_1, id_2, winning_id)

    case result do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Thanks for voting!!")
        |> redirect(to: Routes.t8r_path(conn, :vote))

      {:error, errMsg} ->
        conn
        |> put_flash(:info, "Something went wrong: " <> inspect(errMsg))
        |> redirect(to: Routes.t8r_path(conn, :vote))
    end
  end

  def index(conn, _params) do
    t8r = T8rs.list_t8r()
    render(conn, "index.html", t8r: t8r)
  end

  def new(conn, _params) do
    changeset = T8rs.change_t8r(%T8r{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"t8r" => t8r_params}) do
    case T8rs.create_t8r(t8r_params) do
      {:ok, t8r} ->
        conn
        |> put_flash(:info, "T8r created successfully.")
        |> redirect(to: Routes.t8r_path(conn, :show, t8r))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    t8r = T8rs.get_t8r!(id)
    render(conn, "show.html", t8r: t8r)
  end

  def edit(conn, %{"id" => id}) do
    t8r = T8rs.get_t8r!(id)
    changeset = T8rs.change_t8r(t8r)
    render(conn, "edit.html", t8r: t8r, changeset: changeset)
  end

  def update(conn, %{"id" => id, "t8r" => t8r_params}) do
    t8r = T8rs.get_t8r!(id)

    case T8rs.update_t8r(t8r, t8r_params) do
      {:ok, t8r} ->
        conn
        |> put_flash(:info, "T8r updated successfully.")
        |> redirect(to: Routes.t8r_path(conn, :show, t8r))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", t8r: t8r, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    t8r = T8rs.get_t8r!(id)
    {:ok, _t8r} = T8rs.delete_t8r(t8r)

    conn
    |> put_flash(:info, "T8r deleted successfully.")
    |> redirect(to: Routes.t8r_path(conn, :index))
  end
end
