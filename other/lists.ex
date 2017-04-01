[1, x, 4, y] = [1, 2, 4, 8]
IO.puts x
IO.puts y

insert = [2, 4, 8]
full = [1, insert, 16, 32]
IO.inspect full
neat = List.flatten(full)
IO.inspect neat

a = [1, 2, 4]
b = [8, 16, 32]
IO.inspect [a, b]               # [[1, 2, 4], [8, 16, 32]]
IO.inspect Enum.concat(a, b)    # [1, 2, 4, 8, 16, 32]
IO.inspect a ++ b               # [1, 2, 4, 8, 16, 32]
c = [64, 128, 256]
IO.inspect Enum.concat([c,b,a]) # [64, 128, 256, 8, 16, 32, 1, 2, 4]

# Elixir takes a different approach, letting you process the first item in a list, the head, while extracting the rest of the list, the tail, so that you can pass it to another call recursively. 
list = [1, 2, 4]
[h1 | t1] = list
IO.inspect h1 # 1
IO.inspect t1 # [2, 4]
[h2 | t2] = t1
IO.inspect h2 # 2
IO.inspect t2 # [4]
[h3 | t3] = t2
IO.inspect h3 # 4
IO.inspect t3 # []
# [h4 | t4] = t3 # ** (MatchError) no match of right hand side value: []
IO.inspect Enum.reverse c # [256, 128, 64]

IO.inspect [1 | [2, 3]] # [1, 2, 3]
IO.inspect [1, 2 | [3]] # [1, 2, 3]
IO.inspect [1, 2 | 3]   # [1, 2 | 3] # It not list normal

atomic_info = [{:hydrogen, :H, 1.008}, {:carbon, :C, 12.011}, {:sodium, Na, 22.99}]
IO.inspect List.keyfind(atomic_info, :H, 1) #  {:hydrogen, :H, 1.008}
IO.inspect List.keyfind(atomic_info, :carbon, 0) # {:carbon, :C, 12.011}
IO.inspect List.keyfind(atomic_info, :F, 1) #  nil
IO.inspect List.keyfind(atomic_info, :fluorine, 0, {}) # {}
IO.inspect List.keymember?(atomic_info, :Na, 1) #  true
IO.inspect List.keymember?(atomic_info, :boron, 0) # false
atomic_info2 = List.keystore(atomic_info, :boron, 0,{:boron, :B, 10.081})
IO.inspect atomic_info3 = List.keyreplace(atomic_info2, :B, 1, {:boron, :B, 10.81}) # [{:hydrogen, :H, 1008}, {:carbon, :C, 12.011}, {:sodium, Na, 22.99}, {:boron, :B, 10.81}]
IO.inspect atomic_info4 = List.keydelete(atomic_info3, :fluorine, 0) #[{:hydrogen, :H, 1008}, {:carbon, :C, 12.011}, {:sodium, Na, 22.99}, {:boron, :B, 10.81}]
IO.inspect atomic_info5 = List.keydelete(atomic_info3, :carbon, 0) # [{:hydrogen, :H, 1008}, {:sodium, Na, 22.99}, {:boron, :B, 10.81}]
atomic_info3 = List.keyreplace(atomic_info2, :B, 1, {:zinc, :Zn, 65.38})

planemo_hash = Enum.into([earth: 9.8, moon: 1.6, mars: 3.71], HashDict.new())
# return:  #HashDict<[earth: 9.8, mars: 3.71, moon: 1.6]>
IO.inspect HashDict.has_key?(planemo_hash, :moon) # true
IO.inspect HashDict.has_key?(planemo_hash, :jupiter) # false
IO.inspect HashDict.get(planemo_hash, :jupiter) # nil
IO.inspect HashDict.get(planemo_hash, :jupiter, 0) # 0
planemo_hash2 = HashDict.put_new(planemo_hash, :jupiter, 99.9)
#HashDict<[moon: 1.6, mars: 3.71, jupiter: 99.9, earth: 9.8]>
planemo_hash3 = HashDict.put_new(planemo_hash2, :jupiter, 23.1)
#HashDict<[moon: 1.6, mars: 3.71, jupiter: 99.9, earth: 9.8]>
planemo_hash4 = HashDict.put(planemo_hash3, :jupiter, 23.1)
#HashDict<[moon: 1.6, mars: 3.71, jupiter: 23.1, earth: 9.8]>
planemo_hash5 = HashDict.delete(planemo_hash4,:saturn)
#HashDict<[moon: 1.6, mars: 3.71, jupiter: 23.1, earth: 9.8]>
planemo_hash6 = HashDict.delete(planemo_hash4, :jupiter)
#HashDict<[moon: 1.6, mars: 3.71, earth: 9.8]>

defmodule Overall do
  # Overall.product('funny')
  # Overall.product([1,2,3,4])
  # Overall.product([],2)
  def product([]) do
    0
  end

  def product(list) do
    product(list, 1)
  end

  def product([], accumulated_product) do
    accumulated_product
  end

  def product([head | tail], accumulated_product) do
    product(tail, head * accumulated_product)
  end
end

defmodule ListDrop do
  @moduledoc """
  ListDrop.falls([{:earth, 20}, {:moon, 20}, {:mars, 20}]))
  """
  def falls(list) do
    falls(list, [])
  end

  defp falls([], results) do
    # results
    Enum.reverse(results)
  end

  defp falls([head|tail], results) do
    falls(tail, [Drop.fall_velocity(head) | results])
  end
end
