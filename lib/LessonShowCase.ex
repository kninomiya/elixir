defmodule Lesson.Showcase do
  def open([]), do: IO.puts("見つかりませんでした")
  def open(urls) do
    Enum.each(urls, fn url -> System.cmd("open", [ url ]) end)
  end
end
