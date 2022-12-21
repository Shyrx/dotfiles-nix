{ config, lib, pkgs, ... }:

{
  imports = [
    ./desktop
    ./services
    ./hardware
  ];
}
