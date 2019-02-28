defmodule PrintWriter do

    def println(map) when is_map(map) do
        map
            |> Map.to_list
            |> Enum.map( & ( " " <> (&1 |> map_elem_to_str) ) )
            |> PrintWriter.println
    end

    def println(list) when is_list(list) do
        list |> Enum.map( & ( to_string(&1) )) |> Enum.reduce(& ( &2 <> "" <> &1 )) |> String.trim |> IO.puts
    end

    def println(str) do
       IO.puts(str)
    end

    defp map_elem_to_str(pair) do
        (elem(pair, 0) |> to_string) <> " => " <> (elem(pair, 1) |> to_string)
    end
end
