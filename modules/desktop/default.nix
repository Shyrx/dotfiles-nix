{ config, lib, pkgs, ... }:

{
  imports = [
    ./x.nix
    ./media
    ./shell
  ];
}
