echo Installing configurations...
if ! command -v nvim &> /dev/null
then
	cp ./vimrc ~/.vimrc
	if [ ! -d ~/.vim ]
	then
		mkdir ~/.vim
		echo .vim folder is created in home
	fi
	cp ./vscode.vim ~/colors.vim/
else
	echo NVIM
	if [ ! -d ~/.config/nvim/init.vim ]
	then
		mkdir ~/.config/nvim
		mkdir ~/.config/nvim/colors
		echo nvim folder is created in ~/.config
	elif [ ! -d ~/.config/nvim/colors ]
	then
		mkdir ~/.config/nvim/colors
		echo colors folder is created in ~/.config/nvim
	fi
	cp ./vimrc ~/.config/nvim/init.vim
	cp ./vscode.vim ~/.config/nvim/colors/vscode.vim
fi
