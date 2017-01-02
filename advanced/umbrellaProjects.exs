# Sometimes a project can get big, really big in fact.
# The Mix build tool allows us to split our code into multiple apps

# Introduction
# $ mix new machine_learning_toolkit --umbrella

## Child projects
# cd machine_learning_toolkit/apps
# $ mix new utilities
# $ mix new datasets
# $ mix new svm

## compile
# cd ../../
# $ mix compile

# IEx
# we can interact with all the projects normally.
# $ iex -S mix

# vim apps/datasets/lib/datasets.ex
# defmodule Datasets do
#   def hello do
#     IO.puts "Hello, I'm the datasets"
#   end
# end

# iex> Datasets.hello
# Hello, I'm the datasets
# :ok
