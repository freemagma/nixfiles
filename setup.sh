if [ -d "$1" ]; then
    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
    sudo mv "/etc/nixos" "/etc/nixos.bak"
    sudo ln -s "$SCRIPT_DIR" "/etc/nixos"
    echo "{ imports = [ ./$1 ]; }" >> "$SCRIPT_DIR/configuration.nix"
else 
    echo "Please enter a valid hostname as input" >&2; exit 1;
fi