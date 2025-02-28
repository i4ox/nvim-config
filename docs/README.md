This doc summarizes how to install and use this configuration in detail.

# Prerequisites

## Terminal emulators

Which [terminal emulator](https://en.wikipedia.org/wiki/Terminal_emulator) we choose to use greatly affects the appearance and features of Nvim.
Since NeoVim supports true colors, terminals that support true colors are preferred.

For list of terminals that support true colors, see [here](https://github.com/termstandard/colors).

I prefer [Alacritty](https://github.com/alacritty/alacritty) for its simplicity and good performance.

I also can recommend:

- [Kitty](https://github.com/kovidgoyal/kitty)
- [iTerm2](https://iterm2.com/)
- [WezTerm](https://wezfurlong.org/wezterm/)

### Terminal configuration

See [this](terminal.md) on how to setup your terminal.

## Patched fonts

Since statusline or file explorer plugins often use Unicode symbols not available in normal font, we need to install a patched font from the [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) project.

## Dependencies

```bash
brew install bash # Update bash (otherwise tmux won't work correctly)
brew install bat eza zoxide stow # Must-have cli tools
brew install fzf ripgrep tmux cargo # Tools used alongside with NeoVim
brew install lazygit lazydocker k9s # Tools used for development
```

Also, we need to install [NeoVim](https://neovim.io/) itself.

```bash
brew install neovim
```

## Programming languages

We need to install some programming languages for NeoVim to work properly.
We need to install [Python](https://www.python.org/), [Node.js](https://nodejs.org/) and [Go](https://golang.org/).

I recommend to use this tools for that:

- [pyenv](https://github.com/pyenv/pyenv)
- [nvm](https://github.com/nvm-sh/nvm)
- [goenv](https://github.com/syndbg/goenv)

Also, we need to install [Rust](https://www.rust-lang.org/) because we need [cargo](https://doc.rust-lang.org/cargo/) to build some plugins and tools.

```bash
brew install openssl readline sqlite3 xz zlib tcl-tk@8 # Install dependencies for Python
brew install pyenv nvm goenv # Install version managers
brew install rust # Install Rust
```

## Install NeoVim configuration

Finally, we can install NeoVim configuration.

```bash
git clone https://github.com/alokhov/nvim-config.git ~/dotfiles
cd ~/dotfiles && ./install.sh
```
