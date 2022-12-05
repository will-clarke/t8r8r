defmodule T8r8r.T8rs do
  @moduledoc """
  The T8rs context.
  """

  import Ecto.Query, warn: false
  alias T8r8r.Repo

  alias T8r8r.T8rs.T8r

  def update_from_vote(id_1, id_2, winning_id) do
    t8r_1 = get_t8r!(id_1)
    t8r_2 = get_t8r!(id_2)

    unless(winning_id == id_1 || winning_id == id_2) do
      raise "invalid input; winning_id should match t8r ids in update_from_vote"
    end

    {winner, loser} =
      if winning_id == id_1 do
        {t8r_1, t8r_2}
      else
        {t8r_2, t8r_1}
      end

    {winner_score, loser_score} = calculate_scores(winner.elo_score, loser.elo_score)

    winner_changeset =
      Ecto.Changeset.change(winner,
        votes_total: (winner.votes_total || 0) + 1,
        votes_won: (winner.votes_won || 0) + 1,
        elo_score: winner_score
      )

    loser_changeset =
      Ecto.Changeset.change(loser,
        votes_total: (loser.votes_total || 0) + 1,
        votes_lost: (loser.votes_lost || 0) + 1,
        elo_score: loser_score
      )

    Repo.transaction(fn ->
      Repo.update(winner_changeset)
      Repo.update(loser_changeset)
    end)
  end

  @doc """
  Returns the list of t8r.

  ## Examples

      iex> list_t8r()
      [%T8r{}, ...]

  """
  def list_t8r do
    Repo.all(T8r)
  end

  def get_random_t8rs(n) do
    query =
      from T8r,
        order_by: fragment("RANDOM()"),
        limit: ^n

    Repo.all(query)
  end

  @doc """
  Gets a single t8r.

  Raises `Ecto.NoResultsError` if the T8r does not exist.

  ## Examples

      iex> get_t8r!(123)
      %T8r{}

      iex> get_t8r!(456)
      ** (Ecto.NoResultsError)

  """
  def get_t8r!(id), do: Repo.get!(T8r, id)

  @doc """
  Creates a t8r.

  ## Examples

      iex> create_t8r(%{field: value})
      {:ok, %T8r{}}

      iex> create_t8r(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_t8r(attrs \\ %{}) do
    %T8r{}
    |> T8r.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a t8r.

  ## Examples

      iex> update_t8r(t8r, %{field: new_value})
      {:ok, %T8r{}}

      iex> update_t8r(t8r, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_t8r(%T8r{} = t8r, attrs) do
    t8r
    |> T8r.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a t8r.

  ## Examples

      iex> delete_t8r(t8r)
      {:ok, %T8r{}}

      iex> delete_t8r(t8r)
      {:error, %Ecto.Changeset{}}

  """
  def delete_t8r(%T8r{} = t8r) do
    Repo.delete(t8r)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking t8r changes.

  ## Examples

      iex> change_t8r(t8r)
      %Ecto.Changeset{data: %T8r{}}

  """
  def change_t8r(%T8r{} = t8r, attrs \\ %{}) do
    T8r.changeset(t8r, attrs)
  end

  defp calculate_scores(winner_score, loser_score) do
    {winner_score, loser_score}
  end
end
