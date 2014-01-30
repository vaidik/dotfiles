# Install all the configurations properly

# Don't install these files
IGNORED_FILES="(\.+$|install\.sh|README\.md|\.git)"

SRC_DIR=$(pwd)

# Oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Install git-commands
git clone git@github.com:vaidik/git-commands.git ./.git-commands

# Copy all the required (dot)files
for item in $(ls -a | grep -Ev "$IGNORED_FILES"); do
    ln -sh $SRC_DIR/$item ~/$item
done

# Install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Install vim plugins
vim +BundleInstall +qall
