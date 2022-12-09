{ config, lib, pkgs, ... }:

{
  imports = [
    ./media
    ./network
    ./desktop
    ./services
    ./hardware
  ];
}
