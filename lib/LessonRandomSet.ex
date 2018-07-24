defmodule Lesson.RandomSet do
  @moduledoc """
  Lesson.RandomSet
  """

  alias Lesson.Animals, as: Animals
  @randset_size 4

  @doc """
    ETSレジストリの初期化
  """
  def initRegistry() do
    Animals.initRegistry()
    :ets.new(:randomset_registry, [:set, :protected, :named_table])
  end

  def main() do
    initRegistry()

    generateSet("a12345")
    showSet("a12345")

    generateSet("a12346")
    readAnimalSet("a12346")

  end

  @doc """
  指定されたsetIdに対応するランダム動物セットの取得・標準出力
  """
  def showSet(setId) do
    readAnimalSet(setId) |> Enum.each(fn (animal) -> animal |> IO.puts end)
  end

  defp readRandomSet(setId) do
    [{_, randset}] = :ets.lookup(:randomset_registry, setId)
    randset
  end

  defp saveRandomSet(setId, randomset) do
    :ets.insert(:randomset_registry, {setId, randomset})
  end

  defp generateRandomIndex(maxCount) do
    (:rand.uniform() * maxCount) |> Kernel.trunc
  end

  @doc """
  ランダム動物セットの生成
  """
  def generateSet(setId) do
    maxCount = Animals.count()
    randset = Enum.map(1..@randset_size, fn (_) -> (maxCount |> generateRandomIndex) end)
    saveRandomSet(setId, randset)
  end

  @doc """
  指定されたsetIdに対応するランダム動物セットの取得
  """
  def readAnimalSet(setId) do
    readRandomSet(setId) |> Animals.getFriends
  end
end
