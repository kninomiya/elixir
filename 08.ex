defmodule Cryptogram do
  def cipher(input) do
    String.to_charlist(input)
    |> Enum.map(fn ch ->
      cond do
        ch >= 97 && ch <= 122 ->
          219 - ch
        true ->
          ch
        end
      end)
    |> List.to_string
  end
end

input = "Today's weather is good."

result1 = Cryptogram.cipher(input)
IO.inspect result1

result2 = Cryptogram.cipher(result1)
IO.inspect result2

# 文字コード
# iex(1)> ?a
# 97
# iex(2)> ?z
# 122
# 219 - 文字コード = の形になるので変換の文字列をもう１度読み込ませれば元に戻る。
