# Configs
my config files


## Vim

1. Vim dockfiles require VundleVim to work, run the below command in terminal.
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

2. Put the below code in ~/.vimrc

	if filereadable(expand("~/Dockfiles/vim/.vimrc")) 
		source ~/Dockfiles/vim/.vimrc 
	endif 

