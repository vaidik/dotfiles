set -e

# Install all the configurations properly

# Don't install these files
IGNORED_FILES="(\.+$|install\.sh|README\.md|\.git)"

SRC_DIR=$(pwd)

# Oh-my-zsh
if [[ ! -d ~/.oh-my-zsh ]]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi
for plugin in `cat oh-my-zsh-plugins.list`; do
    pushd  ~/.oh-my-zsh/custom/plugins
    git clone $plugin || echo "Plugin already exists"
    popd
done

# Install git-commands
if [[ ! -d ~/.git-commands ]]; then
    git clone git@github.com:vaidik/git-commands.git ~/.git-commands
fi

# Copy all the required (dot)files
for item in $(ls -a | grep -Ev "$IGNORED_FILES"); do
    ln -sf $SRC_DIR/$item ~/$item
done

# Install vundle
if [[ ! -d ~/.vim/bundle/vundle ]]; then
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

# Install vim plugins
vim +BundleInstall +qall

# Install packages
platform=$(uname)
if [[ $platform = "Darwin" ]]; then
    echo "Found Darwin"
    for brewpackage in `cat brew.list`; do
        brew install $brewpackage
    done
fi
