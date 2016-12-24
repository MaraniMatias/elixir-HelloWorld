IO.puts length [1, 2, 3] # print the length of the list 1,2,3
IO.puts length [7, 5, 4] ++ [8, 4, 3] # print the length of lists  7,5,6 concatenated with 8,4,3
list = [5, 6, 3] # create a list with 5,6,3
IO.puts hd(list) # print the head of list
IO.puts length(tl(list)) # print the length of the tail of list
