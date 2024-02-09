# Install da dotfiles


## Fresh Install
Run these commands on a fresh ubuntu OS install to update your machine.
```shell
sudo apt update
sudo apt upgrade
sudo apt install git
```

Clone down the repository and make a folder for it to live in.
```shell
mkdir ~/.dotfiles
cd ~/.dotfiles
git clone https://github.com/jpsummer/dotfiles.git
```

##### Note!! If you clone with https you will not be able to easily push changes back up to remote. Clone with ssh for that use case.

## Neovim
### Installation
Install a release from [neovim releases](https://github.com/neovim/neovim/releases)\
Or install using a package manager.

MacOS
```shell
brew install neovim
```

Debian Linux
#### apt package manager
```shell
sudo apt-get install neovim
```

#### AppImage
```shell
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage
```
try this command
```shell
chmod u+x nvim.appimage && ./nvim.appimage
```
if neovim successfully launches you can run these next commands.
```shell
mv nvim.appimage /usr/bin/
```
if you get this error message
```
dlopen(): error loading libfuse.so.2

AppImages require FUSE to run. 
```
then try installing neovim with the following commands instead
```shell
./nvim.appimage --appimage-extract
./squashfs-root/usr/bin/nvim
```
and then
```shell
mv squashfs-root/usr/bin/nvim ~/.local/share/applications
echo "alias nvim='~/.local/share/applications/squashfs-root/usr/bin/nvim'" >> ~/.bashrc
source ~/.bashrc
```

Neovim is now installed.


### Neovim config
Now you can copy the nvim config folder to your .config folder.
```shell
cp -r nvim/ ~/.config/nvim
```

### NVIM Package Manager
You need to install Packer for managing neovim plugins.\
For Unix (Linux/MacOS) use the following command to install Packer.
```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### Install Plugins
You can now use the following Packer commands from within neovim to install the plugins included in the nvim/ folder.
```
:PackerCompile
:PackerInstall
```

## Tmux
### Installation
Install using a packager manager.

MacOS
```shell
brew install tmux
```

Debian Linux
```shell
apt install tmux
```

### Package Manager
Now you need to install tpm (tmux package manager) to manage tmux plugins.
```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Install Plugins
Now copy the tmux conf to your home folder (~/).
```shell
cp .tmux.conf ~/.tmux.conf
```

and reload tmux environment so TPM is sourced.
```shell
# type this in terminal if tmux is already running
tmux source ~/.tmux.conf
```
