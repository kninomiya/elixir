defmodule Hello do
input = "Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics."

input
|> String.replace(~r/[,.]/, "")
|> String.split
|> Enum.map(fn word -> String.length(word) end)
|> IO.inspect

end
#x="Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics."
#y=String.replace(x,~r/[,.]/, "")
#z=String.split(y)
#z1 = Enum.map(z,fn(y) -> String.length(y) end)
