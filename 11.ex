filepath = "hightemp.txt"

File.read!(filepath)
|> String.replace("\t"," ")
|> IO.inspect

# File.read!(filepath)
