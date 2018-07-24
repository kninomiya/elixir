defmodule Lesson.AnimalsCli do
  @moduledoc """
  Lesson.AnimalsCli
  """

  alias Lesson.Animals, as: Animals
  alias Lesson.Showcase, as: Showcase
  alias Lesson.ApiDriver, as: ApiDriver

  def main() do
    init()
    "動物の名前を入れてね: " |> IO.gets |> Animals.search |> ApiDriver.searchImage |> Showcase.open
  end

  @randset_size 4

  @doc """
    ETSレジストリの初期化
  """
  def initRegistry() do
    Animals.initRegistry()
    :ets.new(:randomset_registry, [:set, :protected, :named_table])
  end
  def init() do
    try do
      initRegistry()
    rescue
      e in ArgumentError -> ""
    end
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
