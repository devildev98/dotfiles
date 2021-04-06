# Dotfiles

Hi there devildev here!! 👋 All the config files for my Pop!_os is here in this repo. Feel free to use them as you wish😄.

I have also included all the installation commands, it will work in any Debian/Ubuntu based distros.

![Screenshot](./Screenshot.png)

## Applications

- `Awesome` WM (Window MAnager)
- `Qtile` WM (Window Manager)
- `Picom` (Compositor)
- `polybar` for the tittle-bar
- `Rofi` (Enhanced Dmenu)
- `Alacritty` as terminal emulator, GPU accelerated.
- `fish` shell (Better than bash)
- `nvim`(Neo Vim)
  - Vundle for package management
    - Airline for status bar
    - CSS-colors
    - Python syntax
- `starship` as shell prompt.

### Fonts

- `Hack Nerd` Font
- `Fira Code Nerd` Font

## Installation

1. [Awesome WM](https://awesomewm.org/)

It is a window-manager written in `lua` programming language, it is highly customizable and is very beautiful out of the box.

```shell
$ sudo apt install awesome
```

1. [Qtile](http://www.qtile.org/)

It is a window-manager written in Python, and is also very customizable. It comes with a bar(title-bar) out of the box, thus you don't have to use external programs for bar like `Polybar`.

```shell
$ sudo apt-get install qtile
```

1. [Picom](https://github.com/yshui/picom)

Generally in a stand alone window manager, we need a compositor for drawing the windows, and with blur. To do all those fancy things, we can use the compositor Picom.
   
It first needs some libraries to build in debian/ubuntu distros. So install all of them to build picom.

```shell
$ sudo apt-get install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev
```
To Download and build the picom from github.
```shell
$ git clone https://github.com/yshui/picom.git -o picom
$ cd picom
$ git submodule update --init --recursive
$ meson --buildtype=release . build
$ ninja -C build
```
After building, we can install it using ninja with this following command.
```shell
$ ninja -C build install
```

1. [Polybar](https://github.com/polybar/polybar)

It draws a bar at the top/bottom of th screen, such that we can show widgets and workspaces.

```shell
$ sudo apt install polybar
```

1. [Rofi](http://manpages.ubuntu.com/manpages/groovy/man1/rofi.1.html)

It is a Apllication launcher for fast traversal from one application to another. The most minimal application launcher is Dmenu, but it is very mininmal, so we don't get all the basic functionalities. Thus i switched to Rofi.

```shell
$ sudo apt-get install rofi
```

6. [Alacritty](https://github.com/alacritty/alacritty)

It is a GPU accelaterd Terminal Emulator, which offloads some of its rendering to the GPU, if you don't own a GPU also, it looks 🔥

```shell
$ sudo apt install alacritty
```

7. [Fish Shell](https://fishshell.com/)

It is a shell with auto-completition built into it, it is very easy to learn and is very fast.

```shell
$ sudo apt install fish
```

8. [Neovim](https://neovim.io/)

The best editor(vim) on steroids. It is configured in lua, and with plugins it can do wonders, it also supports terminal inside it.

```shell
$ sudo apt install neovim
```
I use [vundle](https://github.com/VundleVim/Vundle.vim) with the neovim for managing my plugins.
```shell
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
```
1. [startship](https://starship.rs/)

The terminal prompt is a very essential thing to people who spend most of their time in the terminal. If u like a very customizable and hackable prompt, that too with 3-4 lines of code. Then go no further, starship is what you need.

```shell
$ curl -fsSL https://starship.rs/install.sh | bash
```
As I am using fish shell, so add this 👇 line to your fish cofig.
```shell
starship init fish | source
```

## Some Terminal Applications

As i spend most of my time in the terminal, thus having some awesome terminal applications, just makes your day way more easier.

- Ufetch (To get the details about system)
- Exa (Replacement of ls)
- Bat (Replacement of cat)