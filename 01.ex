defmodule Hello do

x="パタトクカシー"
y=String.codepoints(x)
z=Enum.take_every(y, 2)
IO.puts(z);

end
