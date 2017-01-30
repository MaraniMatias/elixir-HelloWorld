#!/bin/bash
echo "Add Repo.."
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt install inotify-tools
sudo apt install esl-erlang
sudo apt install elixir
sudo apt install erlang
mix local.hex
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
