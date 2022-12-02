defmodule T8r8rWeb.T8rController do
  use T8r8rWeb, :controller

  alias T8r8r.T8rs
  alias T8r8r.T8rs.T8r

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
