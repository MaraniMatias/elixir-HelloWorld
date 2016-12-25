# 1          integer
# 0x1F       integer
# 1.0        float
# true       boolean
# :atom      atom / symbol
# "elixir"   string
# [1, 2, 3]  list
# {1, 2, 3}  tuple

# number < atom < reference < functions < port < pid < tuple < maps < list < bitstring

# 0b1010    binary      10
# 0o777     octal       511
# 0x1F      hexadecimal 31
# 1.0e-10   expo        1.0e-10

IO.puts 10 / 2
IO.puts div(10, 2)
IO.puts div 10, 2
IO.puts rem 10, 3
IO.puts round(3.58)
IO.puts trunc 3.58

IO.puts :foo                 # :foo
IO.puts :foo == :bar         # false
IO.puts true |> is_atom      # true
IO.puts :true |> is_boolean  # true
IO.puts :true === true       # true

IO.puts false || 42    # 42
IO.puts 42 && true     # true
IO.puts 42 && nil      # nil
IO.puts !42            # false

IO.puts true and 42    # 42
IO.puts false or true  # true
IO.puts not false      # true
#IO.puts !42 # Error

IO.puts 2 == 2.00
IO.puts 2 == '2'
IO.puts 2 === 2.00
IO.puts 2 === '2'

IO.puts :hello > 999                  # true
IO.puts {:hello, :world} > [1, 2, 3]  # false
