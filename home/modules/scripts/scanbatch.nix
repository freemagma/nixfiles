{ pkgs, ...}:

let
  device = "dsseries:usb:0x04F9:0x60E0";
in
  pkgs.writeShellScriptBin "scanbatch" ''
    let page=1
    let quit="e"
    while [ "$quit" != "q" ] 
    do
        echo Scanning Page \#$page
        scanimage --device "${device}" --format pnm -y 279 > "out''${page}.pnm"
        echo 'Press q to quit, or any other key to continue'
        read -n 1 -s quit
        ((page++))
    done
    convert out*.pnm "''${1}"
    rm out*.pnm
  ''