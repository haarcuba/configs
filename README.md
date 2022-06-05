# CONFIGS

This is Haarcuba's personal configs repository.

This is a personal repo, so no guarantee of quality.

I try to support Fedora and Ubuntu.

First, you need to install `rake`, which should be available on your Linux distribution.

Once you have rake, you can see the supported tasks with

    $ rake -T

There is an `all` task that run all tasks in the proper order on a fresh machine.

    $ rake all

Tasks are NOT idempotent.


# NeoVIM

After using `rake neovim`, fire up neovim with `nvim` and use `:PlugInstall` to install all plugins.

I recommend you setup an alias `alias vim=nvim`.
