defmodule Math do
  def sumList([head|tail], accumulator) do
    sumList(tail, head + accumulator)
  end

  def sumList([], accumulator) do
    accumulator
  end
  def getMessage(accumulator) do
  
    "Result #{accumulator}"
  end
end

Math.sumList([1, 2, 3], 0) |> Math.getMessage |> IO.puts #=> 6

