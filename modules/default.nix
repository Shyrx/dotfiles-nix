{ config, lib, pkgs, ... }:

{
  imports = [
    ./media
    ./desktop
    ./shell
    ./services
    ./hardware
  ];
}
