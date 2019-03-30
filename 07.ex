template = fn (x,y,z) -> "#{x}時の#{y}は#{z}" end

IO.inspect template.(12, "気温", 22.4)

# x = fn (x,y,z) -> "#{x}時の#{y}は#{z}" end
# Function<18.128620087/3 in :erl_eval.expr/5>
# x.(12, "気温", 22.4)
# "12時の気温は22.4"
