defmodule Hello do

filepath = "hightemp.txt"

File.read!(filepath)
|> String.replace("\t"," ")
|> IO.inspect

end
