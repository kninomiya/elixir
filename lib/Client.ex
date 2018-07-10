defmodule Client do
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Tick.register(pid)
  end

  def receiver() do
    receive do
      {:tick, message} ->
        IO.puts "tock in client with #{message}"
        receiver()
    end
  end
end


