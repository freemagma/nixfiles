{ pkgs, ... }:
pkgs.writeShellScriptBin "resetblue" ''
    bluetoothctl -- power off
    sleep 0.1
    pulseaudio --kill
    sleep 0.3
    pulseaudio --start
    sleep 0.1
    bluetoothctl -- power on
    sleep 0.1
    bluetoothctl -- connect ''${1}
''