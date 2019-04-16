defmodule Hello do

filepath = "hightemp.txt"
input = File.stream!(filepath)

input
|> Enum.uniq
|> length
|> IO.inspect

end



# モジュール名を省略できるモジュールもある。（例:Kernelモジュール）
# iex(3)> File.stream!(filepath) |> Enum.to_list |> Kernel.length
# 24
# iex(4)> File.stream!(filepath) |> Enum.to_list |> length
# 24
# iex(2)> File.stream!(filepath) |> Enum.uniq |> Kernel.length
# 24
