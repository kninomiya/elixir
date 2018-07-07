defmodule Lesson.Animals do

  defp getUrl, do: "https://gist.githubusercontent.com/uneco/5856580/raw/bc117e88b6d4e45fc1e65cac277c1184a65486cd/animal.txt"

  defp download() do

    case getUrl() |> HTTPoison.get! do
      %HTTPoison.Response{body: body, status_code: 200} ->
        saveAnimals(body)
        IO.puts("どうぶつマスタをダウンロードしました")
      %HTTPoison.Error{reason: reason} -> raise "Oops, #{reason}"
    end
  end

  @doc """
  キャッシュ領域(ETS)に動物リスト保存用のレジストリを初期作成する
  """
  def initRegistry() do
    :ets.new(:animals_registry, [:set, :protected, :named_table])
    download()
  end

  @doc """
  キャッシュ領域(ETS)に動物リストを保存する
  """
  def saveAnimals(body) do
     animals = (body |> String.split("\n"))
    :ets.insert(:animals_registry, {"animals", animals})
  end

  @doc """
  キャッシュ領域(ETS)から動物リストを読み出す
  """
  def readAnimals() do
    [{"animals", animals }] = :ets.lookup(:animals_registry, "animals")
    animals
  end

  @doc """
  入力した名前の動物がいるか検索する

  Returns `検索結果メッセージ`.

  ## Examples

  ```
  iex> Lesson.Animals.search("アイアイ")
  "いいね, アイアイ"
  
  iex> Lesson.Animals.search("ねず")
  "ネズ, おしいっ"

  iex> Lesson.Animals.search("ルカク")
  "いないみたい..."
  ```
  """

  def search(input) do

    animalName = input |> String.trim |> Mojiex.convert({:hg, :kk})
    animals = readAnimals()

    cond do
      Enum.any?(animals, &( &1 === animalName ) ) -> "いいね, #{animalName}"
      Enum.any?(animals, &( String.contains?(&1, animalName) ) ) -> "#{animalName}, おしいっ"
      true -> "いないみたい..."
    end
  end

  def count() do
    readAnimals() |> length
  end

  def getFriend(index) do
    readAnimals() |> Enum.at(index)
  end

  def getFriends(indexes) do
    animals = readAnimals()
    Enum.map(indexes, fn (index) -> Enum.at(animals, index) end)
  end
end
