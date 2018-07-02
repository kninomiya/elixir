defmodule Lesson.Animals do
  defp getUrl, do: "https://gist.githubusercontent.com/uneco/5856580/raw/bc117e88b6d4e45fc1e65cac277c1184a65486cd/animal.txt"

  defp getLocalPath, do: "./animals.txt"

  defp download() do
    case getUrl() |> HTTPoison.get! do
      %HTTPoison.Response{body: body, status_code: 200} -> getLocalPath() |> File.write!(body)
      %HTTPoison.Error{reason: reason} -> {:error, reason}
    end
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
    if getLocalPath() |> File.exists?() === false do
      case download() do
        {:error, reason} -> raise "Oops, #{reason}"
        _ -> IO.puts("どうぶつマスタをダウンロードしました")
      end
    end

    animalName = input |> String.trim |> Mojiex.convert({:hg, :kk})
    animals = getLocalPath() |> File.read!() |> String.split("\n")

    cond do
      Enum.any?(animals, &( &1 === animalName ) ) -> "いいね, #{animalName}"
      Enum.any?(animals, &( String.contains?(&1, animalName) ) ) -> "#{animalName}, おしいっ"
      true -> "いないみたい..."
    end
  end
end
