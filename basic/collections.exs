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

# Tuples
IO.puts {3.14, :pie, "Apple"}
# return
File.read("path/to/existing/file")  # {:ok, "... contents ..."}
File.read("path/to/unknown/file")   # {:error, :enoent}

IO.puts [foo: "bar", hello: "world"]        # [foo: "bar", hello: "world"]
IO.puts [{:foo, "bar"}, {:hello, "world"}]  # [foo: "bar", hello: "world"]
# The three characteristics of keyword lists highlight their importance
## Keys are atoms.
## Keys are ordered.
## Keys are not unique.

# Maps

