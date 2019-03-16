defmodule Hello do

x="パトカー"
y="タクシー"
# x1=String.codepoints(x)
# y1=String.codepoints(y)
z=Enum.zip(x,y)
# Enum.flat_map(fn {x1, y1} -> [x1, y1] end)
# Enum.join
# IO.inspect
IO.puts(z);
end
