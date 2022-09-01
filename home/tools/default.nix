{ config, lib, pkgs, ... }:

{
  imports = [
    ./direnv.nix
    ./git.nix
    ./htop.nix
    ./udisk.nix
    ./gnupg.nix
  ];
}
