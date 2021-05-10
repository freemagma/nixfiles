if [ -d "home/hosts/$1" ]; then
    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
    sudo mv "/etc/nixos" "/etc/nixos.bak"
    sudo ln -s "$SCRIPT_DIR/nixos/$1" "/etc/nixos"
    mv "$HOME/.config/nixpkgs" "$HOME/.config/nixpkgs.bak"
    ln -s "$SCRIPT_DIR/home/hosts/$1" "$HOME/.config/nixpkgs"
    ln -s "$SCRIPT_DIR/home/modules" "$SCRIPT_DIR/home/hosts/$1/modules"
else 
    echo "Please enter a valid hostname as input" >&2; exit 1;
fi