# Install da dotfiles


## Fresh Install
Run these commands on a fresh ubuntu OS install to update your machine.
```shell
sudo apt update
sudo apt upgrade
```

Now install the dependencies
```shell
sudo apt install git \
gcc \
python3-pip \
curl \
unzip \
ripgrep \
fd-find \
```

You will also need to install Node.js and npm for some dependencies. You can install those both through the apt package manager if you don't intend to develop using any modern frameworks (React, Angular)  
Otherwise, you will need a more recent version of Node, you can download the node version directly or install a version manager like [nvm](https://github.com/nvm-sh/nvm).
```shell
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```
reload bash config to start using nvm
```shell
source ~/.bashrc
```
to use nvm, you can run the following command to find the latest LTS release.
```shell
nvm ls-remote --lts
```
then install whatever release you want
```
nvm install 20.11.0
```
confirm with `node -v`
```
v20.11.0
```

and finally,
```shell
pip install neovim
npm install -g neovim
```

## Nerd Font
Don't forget to install a nerd font!  
[Browse Nerd Fonts Here](https://www.nerdfonts.com/font-downloads)

## Da Dotfiles
Clone down the repository and make a folder for it to live in.
```shell
mkdir ~/.dotfiles
cd ~/.dotfiles
git clone https://github.com/jpsummer/dotfiles.git
```

##### Note!! If you clone with https you will not be able to easily push changes back up to remote. Clone with ssh for that use case.

## Neovim
Last Confirmed Working on NVIM v0.9.5
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
The best way to copy the neovim config is to symlink the git directory config to the .config folder.  
This ensures that you are still able to get the most latest updates simply by just git pulling.  
Or pushing your own updates simply by git pushing.  


To symlink the config folder run the following command *replace <user-name> with your ubuntu username*
```shell
ln -s /home/<user-name>/.dotfiles/dotfiles/nvim /home/<user-name>/.config
```
Ex.
```shell
ln -s /home/jpsummer/.dotfiles/dotfiles/nvim /home/jpsummer/.config
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
