{ config, lib, pkgs, ... }:

{
  imports = [
    ./media
    ./desktop
    ./services
    ./hardware
  ];
}
