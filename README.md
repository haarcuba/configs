# CONFIGS

This is Haarcuba's personal configs repository.

It has a Makefile that takes care of everything. It assumes you are using Ubuntu.

    $ make # setup everything

You can also use individual tasks (you will usually need the `packages` in any other task):

    $ make packages neovim

# NeoVIM

After using `make neovim`, fire up neovim with  `nvim` and use `:PlugInstall` to install all plugins.

I recommend you setup an alias `alias vim=nvim`.




