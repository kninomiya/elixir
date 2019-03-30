input = "I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."

String.split(input)
|> Enum.map(fn word ->
    cond do
      String.length(word) <= 4 ->
        word
      true ->
        max = String.length(word) - 1
        (word |> String.at(0)) <>
          (word |> String.slice(1..max-1) |> String.codepoints |> Enum.shuffle |> List.to_string) <>
          (word |> String.at(max))
    end
  end)
|> IO.inspect
