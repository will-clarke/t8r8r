defmodule T8r8rWeb.T8rControllerTest do
  use T8r8rWeb.ConnCase

  import T8r8r.T8rsFixtures

  @create_attrs %{elo_score: 42, image_location: "some image_location", votes_lost: 42, votes_total: 42, votes_won: 42}
  @update_attrs %{elo_score: 43, image_location: "some updated image_location", votes_lost: 43, votes_total: 43, votes_won: 43}
  @invalid_attrs %{elo_score: nil, image_location: nil, votes_lost: nil, votes_total: nil, votes_won: nil}

  describe "index" do
    test "lists all t8r", %{conn: conn} do
      conn = get(conn, Routes.t8r_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing T8r"
    end
  end

  describe "new t8r" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.t8r_path(conn, :new))
      assert html_response(conn, 200) =~ "New T8r"
    end
  end

  describe "create t8r" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.t8r_path(conn, :create), t8r: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.t8r_path(conn, :show, id)

      conn = get(conn, Routes.t8r_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show T8r"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.t8r_path(conn, :create), t8r: @invalid_attrs)
      assert html_response(conn, 200) =~ "New T8r"
    end
  end

  describe "edit t8r" do
    setup [:create_t8r]

    test "renders form for editing chosen t8r", %{conn: conn, t8r: t8r} do
      conn = get(conn, Routes.t8r_path(conn, :edit, t8r))
      assert html_response(conn, 200) =~ "Edit T8r"
    end
  end

  describe "update t8r" do
    setup [:create_t8r]

    test "redirects when data is valid", %{conn: conn, t8r: t8r} do
      conn = put(conn, Routes.t8r_path(conn, :update, t8r), t8r: @update_attrs)
      assert redirected_to(conn) == Routes.t8r_path(conn, :show, t8r)

      conn = get(conn, Routes.t8r_path(conn, :show, t8r))
      assert html_response(conn, 200) =~ "some updated image_location"
    end

    test "renders errors when data is invalid", %{conn: conn, t8r: t8r} do
      conn = put(conn, Routes.t8r_path(conn, :update, t8r), t8r: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit T8r"
    end
  end

  describe "delete t8r" do
    setup [:create_t8r]

    test "deletes chosen t8r", %{conn: conn, t8r: t8r} do
      conn = delete(conn, Routes.t8r_path(conn, :delete, t8r))
      assert redirected_to(conn) == Routes.t8r_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.t8r_path(conn, :show, t8r))
      end
    end
  end

  defp create_t8r(_) do
    t8r = t8r_fixture()
    %{t8r: t8r}
  end
end
