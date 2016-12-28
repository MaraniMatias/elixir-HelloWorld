#!/bin/bash
echo "Add Repo.."
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt install esl-erlang
sudo apt install elixir
sudo apt install erlang
