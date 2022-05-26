{ pkgs, ... }:
pkgs.writeShellScriptBin "resetwifi" ''
  WIFI_NAME=$(nmcli c show --active | grep "wifi" | awk '{print $1;}')
  nmcli c down ''${WIFI_NAME}
  sleep 0.1
  nmcli c up ''${WIFI_NAME}
''
