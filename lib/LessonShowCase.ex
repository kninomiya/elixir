defmodule Lesson.Showcase do
  def open(urls) do
    Enum.each(urls, fn url -> System.cmd("open", [ url ]) end)
  end
end
