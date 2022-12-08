{ config, lib, pkgs, ... }:

{
  imports = [ ./nvidia.nix ./x.nix ];
}
