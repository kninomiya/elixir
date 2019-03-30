filepath = "hightemp.txt"

File.stream!(filepath)
|> Enum.to_list
|> length
|> IO.inspect

# モジュール名を省略できるモジュールもある。（例:Kernelモジュール）
# iex(3)> File.stream!(filepath) |> Enum.to_list |> Kernel.length
# 24
# iex(4)> File.stream!(filepath) |> Enum.to_list |> length
# 24
