# Sprockets Assistant

An upgraded `Sprockets::Secretary`. A simple way to let me build little libraries and widgets and
things for various projects, while still taking advantage of all the Sprockets libraries and goodness
that I use elsewhere.

## Usage

    gem install sprockets-assistant
    sprockets-assistant create my_project
    cd my_project
    bundle exec sprockets-assistant

This starts a server on localhost:8080. Hack away.

## `assistant_config.rb`

Prett simple DSL:

### `middleware`

Define a middleware stack.

### `app`

This is the guts of a `Sinatra::Base` app.

### `compile`

A list of files to compile with `sprockets-assistant compile`.

