defmodule Ngram do
  # ngram(["a", "b", "c"], 2) -> [["a", "b"], ["b", "c"]]
  def ngram(input, len) when is_list(input) do
    _ngram(input, len, length(input) - len, [])
  end

  # ngram("abc", 2) -> ["ab", "bc"]
  def ngram(input, len) when is_binary(input) do
    _ngram(String.codepoints(input), len, String.length(input) - len, [])
    |> Enum.map(&List.to_string/1)
  end

  defp _ngram(_,     _,   n, acc) when n <  0 do acc end
  defp _ngram(input, len, n, acc) when n >= 0 do
    result = input |> Enum.slice(n..(n + len - 1))
    _ngram(input, len, n-1, [result | acc])
  end
end

input1 = "paraparaparadise"
input2 = "paragraph"

x = Ngram.ngram(input1, 2) |> MapSet.new
y = Ngram.ngram(input2, 2) |> MapSet.new

# 和集合
IO.inspect MapSet.union(x, y)
# => #MapSet<["ad", "ag", "ap", "ar", "di", "gr", "is", "pa", "ph", "ra", "se"]>

# 積集合
IO.inspect MapSet.intersection(x, y)
# => #MapSet<["ap", "ar", "pa", "ra"]>

# 差集合
IO.inspect MapSet.difference(x, y)
# => #MapSet<["ad", "di", "is", "se"]>


# a = "paraparaparadise"
# b = "paragraph"
