# Installation

## Neovim
Install a release from [neovim releases](https://github.com/neovim/neovim/releases)\
Or install using a package manager.

MacOS
```shell
brew install neovim
```

Debian Linux
```shell
sudo apt-get install neovim
```

Now you can copy the nvim folder to your home folder (~/).
```shell
cp -r nvim/ ~/nvim
```

You need to install Packer for managing neovim plugins.\
For Unix (Linux/MacOS) use the following command to install Packer.
```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

You can now use the following Packer commands from within neovim to install the plugins included in the nvim/ folder.
```
:PackerCompile
:PackerInstall
```

## Tmux
Install using a packager manager.

MacOS
```shell
brew install tmux
```

Debian Linux
```shell
apt install tmux
```

Now you need to install tpm (tmux package manager) to manage tmux plugins.
```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Now copy the tmux conf to your home folder (~/).
```shell
cp .tmux.conf ~/.tmux.conf
```

and reload tmux environment so TPM is sourced.
```shell
# type this in terminal if tmux is already running
tmux source ~/.tmux.conf
```
