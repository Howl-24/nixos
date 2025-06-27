{ pkgs, ... }:
pkgs.writeShellScriptBin "smb-nasix-public" ''
  if [ ! -d "/mnt/smb" ]; then
  	sudo mkdir /mnt/smb
  fi

  sudo mount -t cifs //192.168.0.56/public /mnt/smb -o guest
''
