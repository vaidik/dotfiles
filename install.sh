# Install all the configurations properly

# Don't install these files
IGNORED_FILES="(\.+$|install\.sh|README\.md|\.git)"

SRC_DIR=$(pwd)

# Oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Install git-commands
git clone git://github.com:vaidik/git-commands.git ./.git-commands

# Copy all the required (dot)files
for item in $(ls -a | grep -Ev "$IGNORED_FILES"); do
    ln -sf $SRC_DIR/$item ~/$item
done

# Install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Install vim plugins
vim +BundleInstall +qall

# Install packages
platform=$(uname)
if [[ $platform = "Darwin" ]]; then
    echo "Found Darwin"
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    source ~/.
    for brewpackage in `cat brew.list`; do
        brew install $brewpackage
    done
fi
