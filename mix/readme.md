# New Projects
```sh
  mix new hello
```

# mix.exs (package.json in NodeJS)
Here we configure our application, dependencies, environment, and version.

# Compilation
Mix is smart and will compile your changes when necessary, but it may still be necessary explicitly compile your project.
```sh
  mix compile
```
# Managing Dependencies
[hex.pm](Hex (NPM in NodeJS))
```sh
  mix local.hex
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

# Hello
```sh
  mix hello
```

# ExDoc
```sh
  mix new greet_everyone
  mix local.hex
  iex -S mix
  iex(1)> h Greeter.hello
```
```sh
  mix deps.get # gets ExDoc + Earmark.
  mix docs # makes the documentation.
```

# Phoenix (Tihs is more then Express in NodeJS)
[http://www.phoenixframework.org/docs/installation](Install Phoenix)
```sh
  mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

  mix phoenix.new my_phoenix_app
  cd my_phonenix_app
  mix deps.get
```
