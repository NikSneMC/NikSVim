{lib, ...}: let
  mkServersList = servers:
    lib.pipe servers [
      (map (server: lib.nameValuePair server {enable = true;}))
      builtins.listToAttrs
    ];
in {
  inherit mkServersList;
}
