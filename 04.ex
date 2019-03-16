defmodule Symbol do

input = "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can."
singles = [1, 5, 6, 7, 8, 9, 15, 16, 19]

input
|> String.split
|> Enum.with_index(1) # index from 1
|> Enum.map(fn {word, index} ->
    if index in singles do
      {String.first(word), index}
    else
      {String.slice(word, 0..1), index}
    end
  end)
|> Enum.into(%{})
|> IO.inspect
end

# a = "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can."
# b = [1, 5, 6, 7, 8, 9, 15, 16, 19]
# c = String.split(a)
# d = Enum.with_index(c)
# e = Enum.map(d, fn{word, index} ->
# if index in b do
# {String.first(word), index}
# else
# {String.slice(word, 0..1), index}
# end
# end)
