#!/bin/bash

# -*- ENCODING: UTF-8 -*-
mix deps.get
mix compile
mix ecto.drop
mix ecto.create
mix ecto.migrate
mix run priv/repo/seeds.exs
npm install