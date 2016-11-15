cleanlocal:
		# remove files here if they exist
		rm -f ./bash_profile
		rm -f ./vimrc
		rm -f ./tmux.conf
		rm -f ./karabiner.json
		rm -f ./.urls_config.yml

cpexisting: cleanlocal
		# copy dem dotfiles babay
		cp ~/.bash_profile ./bash_profile
		cp ~/.vimrc ./vimrc
		cp ~/.tmux.conf ./tmux.conf
		cp ~/.config/karabiner/karabiner.json .
		cp ~/.urls_config.yml ./urls_config.yml

sync: cpexisting
