result_file = File.stream!("./col1.txt", [:write])
result2_file = File.stream!("./col2.txt", [:write])

File.stream!(filepath)|> Stream.map(&String.replace(&1, "\t", " ")) |> Stream.map(&String.split(&1, " ")) |> Stream.map(&Enum.at(&1,0)) |> Stream.into( result_file, &( &1<>"\n" )) |> Stream.run()

File.stream!(filepath)|> Stream.map(&String.replace(&1, "\t", " ")) |> Stream.map(&String.split(&1, " ")) |> Stream.map(&Enum.at(&1,1)) |> Stream.into( result_file2, &( &1<>"\n" )) |> Stream.run()

# 12と13やったらdefmoduleで書いてみる
