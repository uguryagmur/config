sudo apt install ripgrep

echo creating directory for neovim setup
if [! -d ~/Shop ]
then
	mkdir -p ~/Shop/neovim
elif [! -d ~/Shop/neovim ]
	mkdir ~/Shop/neovim
fi

echo installing neovim
pushd ~/Shop/neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

echo installing packer for neovim package management
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo neoviim alias setup on bashrc
echo "# neovim alias setup" >> ~/.bashrc
echo "alias vim=~/Shop/neovim/nvim.appimage" >> ~/.bashrc
echo "alias nvim=~/Shop/neovim/nvim.appimage" >> ~/.bashrc
echo "alias neovim=~/Shop/neovim/nvim.appimage" >> ~/.bashrc
git config --global core.editor "~/Shop/neovim/nvim.appimage"

echo installing configurations for neovim

if [ ! -d ~/.config/nvim/colors ]
then
	mkdir -p ~/.config/nvim/colors
fi

cp ./init.vim ~/.config/nvim/init.vim
cp ./vscode.vim ~/.config/nvim/colors/vscode.vim
cp -r ./lua ~/.config/nvim
cp -r ~/.config/nvim

echo configurations are completed
