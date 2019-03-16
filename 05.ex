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

input = "I am an NLPer"

input |> Ngram.ngram(2) |> IO.inspect
# => ["I ", " a", "am", "m ", " a", "an", "n ", " N", "NL", "LP", "Pe", "er"]

input |> String.split |> Ngram.ngram(2) |> IO.inspect
# => [["I", "am"], ["am", "an"], ["an", "NLPer"]]
