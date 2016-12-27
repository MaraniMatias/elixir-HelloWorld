defmodule Example do
  def greeting(name) do
    "Hello #{name}."
  end
end
IO.puts  Example.greeting "Sean" # "Hello Sean."

defmodule Example.Greetings do
  def morning(name) do
    "Good morning #{name}."
  end
  def evening(name) do
    "Good night #{name}."
  end
end
IO.puts  Example.Greetings.morning "Sean" # "Good morning Sean."

# Module Attributes
defmodule ExampleMA do
  @greeting "Hello"
  def greeting(name) do
    ~s(#{@greeting} #{name}.)
  end
end

# Structs
defmodule ExampleS.User do
  defstruct name: "Sean", roles: []
end
# ExampleS.User{}
# ExampleS.User{name: "Steve"}
# ExampleS.User{name: "Steve", roles: [:admin, :owner]}

# steve = Example.User{name: "Steve", roles: [:admin, :owner]}
  # %Example.User{name: "Steve", roles: [:admin, :owner]}
# sean = {steve | name: "Sean"}
  # %Example.User{name: "Sean", roles: [:admin, :owner]}
# {name: "Sean"} = sean
  # %Example.User{name: "Sean", roles: [:admin, :owner]}

# Composition
## alias
defmodule Sayings.Greetings do
  def basic(name), do: "Hi, #{name}"
end

defmodule ExampleCa do
  alias Sayings.Greetings
  def greeting(name), do: Greetings.basic(name)
end

### Without alias
defmodule ExampleWa do
  def greeting(name), do: Sayings.Greetings.basic(name)
end

### as
defmodule ExampleAs do
  alias Sayings.Greetings, as: Hi
  def print_message(name), do: Hi.basic(name)
end

### multi-alias
defmodule ExampleMultiAlias do
  alias Sayings.{Greetings, Farewells}
end

## import
# last([1, 2, 3]) # ** (CompileError) iex:9: undefined function last/1
IO.puts  import List # nil
IO.puts  last([1, 2, 3]) # 3

### only
import List, only: [last: 1]
import List, only: :functions
import List, only: :macros

### except
import List, except: [last: 1]

## require
defmodule Example do
  require SuperMacros
  SuperMacros.do_stuff
end

## use
defmodule MyModule do
  defmacro __using__(opts) do
    quote do
      import MyModule.Foo
      import MyModule.Bar
      import MyModule.Baz
      alias MyModule.Repo
    end
  end
end

