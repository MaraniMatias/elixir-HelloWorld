list =  [3.14, :pie, "Apple"]
list ++ ["Cherry"]
["hola"] ++ list
IO.puts list[0]
[1, 2] ++ [3, 4, 1]
[1, 2] -- [3, 1]
[1,2,2,3,2,3] -- [1,2,3,2]
["foo", :bar, 42] -- [42, "bar"]

# Head / Tail
IO.puts hd [3.14, :pie, "Apple"]      # 3.14
IO.puts tl [3.14, :pie, "Apple"]      # [:pie, "Apple"]
IO.puts [h|t] = [3.14, :pie, "Apple"] # [3.14, :pie, "Apple"]
IO.puts h                             # 3.14
IO.puts t                             # [:pie, "Apple"]


