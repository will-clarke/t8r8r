defmodule T8r8r.T8rsTest do
  use T8r8r.DataCase

  alias T8r8r.T8rs

  describe "t8r" do
    alias T8r8r.T8rs.T8r

    import T8r8r.T8rsFixtures

    @invalid_attrs %{elo_score: nil, image_location: nil, votes_lost: nil, votes_total: nil, votes_won: nil}

    test "list_t8r/0 returns all t8r" do
      t8r = t8r_fixture()
      assert T8rs.list_t8r() == [t8r]
    end

    test "get_t8r!/1 returns the t8r with given id" do
      t8r = t8r_fixture()
      assert T8rs.get_t8r!(t8r.id) == t8r
    end

    test "create_t8r/1 with valid data creates a t8r" do
      valid_attrs = %{elo_score: 42, image_location: "some image_location", votes_lost: 42, votes_total: 42, votes_won: 42}

      assert {:ok, %T8r{} = t8r} = T8rs.create_t8r(valid_attrs)
      assert t8r.elo_score == 42
      assert t8r.image_location == "some image_location"
      assert t8r.votes_lost == 42
      assert t8r.votes_total == 42
      assert t8r.votes_won == 42
    end

    test "create_t8r/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = T8rs.create_t8r(@invalid_attrs)
    end

    test "update_t8r/2 with valid data updates the t8r" do
      t8r = t8r_fixture()
      update_attrs = %{elo_score: 43, image_location: "some updated image_location", votes_lost: 43, votes_total: 43, votes_won: 43}

      assert {:ok, %T8r{} = t8r} = T8rs.update_t8r(t8r, update_attrs)
      assert t8r.elo_score == 43
      assert t8r.image_location == "some updated image_location"
      assert t8r.votes_lost == 43
      assert t8r.votes_total == 43
      assert t8r.votes_won == 43
    end

    test "update_t8r/2 with invalid data returns error changeset" do
      t8r = t8r_fixture()
      assert {:error, %Ecto.Changeset{}} = T8rs.update_t8r(t8r, @invalid_attrs)
      assert t8r == T8rs.get_t8r!(t8r.id)
    end

    test "delete_t8r/1 deletes the t8r" do
      t8r = t8r_fixture()
      assert {:ok, %T8r{}} = T8rs.delete_t8r(t8r)
      assert_raise Ecto.NoResultsError, fn -> T8rs.get_t8r!(t8r.id) end
    end

    test "change_t8r/1 returns a t8r changeset" do
      t8r = t8r_fixture()
      assert %Ecto.Changeset{} = T8rs.change_t8r(t8r)
    end
  end
end
