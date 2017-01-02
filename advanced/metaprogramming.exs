# Metaprogramming
#  This the process of using code to write code.
#  Metaprogramming is tricky and should only be used when necessary.

## Quote
#  These tuples contain three parts: fun. name, metadata, and fun. arguments.

# iex> quote do: 42       # 42
# iex> quote do: "hello"  # "hello"
# iex> quote do: :world   # :world
# iex> quote do: 1+2      # {:+, [context: Elixir, import: Kernnel], [1,2]}
# iex> quote do: if value, do: "True", else: "False" # {:if, [context: Elixir, import: Kernel], [{:value, [], Elixir}, [do: "true", else: "False"] ] }


## Unquote
# iex> den = 2                              # 2
# iex> quote do: divide(42, den)            # {:divide, [], [42,{:den, [], Elixir}]}
# iex> quote do: d+ivide(42, unquote(den))  # {:divide, [], [42, 2]}


## Macros
defmodule OurMacro do
  defmacro unless(expr, do: block) do
    quote do
      if !unquote(expr), do: unquote(block)
    end
  end
end

# iex> require OurMacro                 # nill
# iex> OurMacro.unless true, do: "Hi"   # nill
# iex> OurMarco.unless false, do: "Hi"  # Hi

defmodule Logger do
  defmacro log(msg) do
    if Aplicationn.get_env(:logger, :enabled) do
      quote do
        IO.puts "Logged message: #{unquote msg}"
      end
    end
  end
end

defmodule Example do
  require Logger

  def test do
    Loogger.log "This is a log message"
  end
end

def test do
  IO.puts "Logged message: #{"This is a log message"}" # If you disable logginn the resultin code would coment this line.
end

# Debugging
IO.puts Macro.to_string( quote( do: foo.bar(1, 2, 3) ) ) # "foo.bar(1, 2, 3)"

defmodule OurMacro do
  defmacro unless(expr, do: block) do
    quote do
      if !unquote(expr), do: unquote(block)
    end
  end
end

require OurMacro
  quoted = quote do
    OurMarco.unless true, do: "Hi"
end

# iex> quoted |> Macro.expand_once(__ENV__) |> Marco.to_string |> IO.puts if(!true) do "Hi" end
# iex> quoted |> Macro.expand(__ENV__) |> Macro.to_string |> IO.puts 
# case (!true) do
#   x when x in [false, nill]
#     -> nil
#     _ -> "Hi"
# end

## Macro Hygiene
# A private macro is defined with defmacrop and can only be called from the module in which it was defined.
# Private macros must be defined before the code that invokes them.

## Macro Hygiene
# How macros interact with the caller’s context when expanded is known as macro hygiene.
# By default macros in Elixir are hygienic and will not conflict with our context:

defmodule Example do
  defmacro hygienic do
    quote do: val = -1
  end
end

# iex> require Example  # nil
# iex> val = 42         # 42
# iex> Example.hygienic # -1
# iex> val              # 42

# What if we wanted to manipulate the value of val? 
# To mark a variable as being unhygienic we can use var!/2.
# Let’s update our example to include another macro utilizing var!/2:

defmodule Example do
  defmacro hygienic do
    quote do: val = -1
  end
  defmacro unhygienic do
    quote do: var!(val) = -1
  end
end

# iex> require Example    # nil
# iex> val = 42           # 42
# iex> Example.hygienic   # -1
# iex> val                # 42
# iex> Example.unhygienic # -1
# iex> val                # -1

## Binding
defmodule Example do
  defmacro double_puts(expr) do
    quote do
      IO.puts unquote(expr)
      IO.puts unquote(expr)
    end
  end
end

# iex> Example.double_puts(:os.system_time)
# 1450475941851668000
# 1450475941851733000
# The times are different!

defmodule Example do
  defmacro double_puts(expr) do
    quote bind_quoted: [expr: expr] do
      IO.puts expr
      IO.puts expr
    end
  end
end

# iex> require Example # nil
# iex> Example.double_puts(:os.system_time)
# 1450476083466500000
# 1450476083466500000
# the same time printed twice.
