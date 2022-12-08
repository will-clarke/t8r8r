defmodule T8r8r.Words do
  def vote_instruction do
    Enum.random(adjectives()) <> " " <> Enum.random(nouns())
  end

  def best do
    Enum.random([
      "the best",
      "the juiciest",
      "the loveliest",
      "the most wonderful",
      "the steamiest",
      "the most gorgeous",
      "the most fabulous",
      "your favourite",
      "your all-time fave"
    ])
  end

  defp adjectives do
    ["nice", "steamy", "delicious", "fab", "fantastic", "gorgeous"]
  end

  defp nouns do
    ["t8r"]
  end
end
