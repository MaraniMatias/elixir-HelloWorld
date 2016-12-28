# New Projects
```sh
mix new example
```

# mix.exs (package.json in node.js)
  Here we configure our application, dependencies, environment, and version.

# Compilation
  Mix is smart and will compile your changes when necessary, but it may still be necessary explicitly compile your project.
```sh
mix compile
```
# Managing Dependencies
```sh
mix deps.get
```
# Environments
 Mix, much like Bundler, supports differing environments. Out of the box mix works with three environments:
 * :dev — The default environment.
 * :test — Used by mix test. Covered further in our next lesson.
 * :prod — Used when we ship our application to production.
The current environment can be accessed using Mix.env. As expected, the environment can be changed via the MIX_ENV environment variable:
```sh
MIX_ENV=prod mix compile
```

#ExDoc

```sh
mix new greet_everyone
iex -S mix
iex(1)> h Greeter.hello
```
```sh
mix deps.get # gets ExDoc + Earmark.
mix docs # makes the documentation.
```
