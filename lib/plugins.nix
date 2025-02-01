{
  lib,
  pkgs,
  ...
}: let
  mkPluginsList = plugins:
    lib.pipe plugins [
      (map (plugin:
        lib.nameValuePair plugin {
          enable = true;
        }))
      builtins.listToAttrs
    ];

  mkExtraPluginsList = lib.mapAttrsToList (
    name: {
      package ? null,
      owner ? null,
      repo ? name,
      rev ? null,
      hash ? null,
      config ? "",
      optional ? false,
      ...
    }: {
      inherit config optional;
      plugin =
        if package != null
        then package
        else
          pkgs.vimUtils.buildVimPlugin {
            name = name;
            src = pkgs.fetchFromGitHub {inherit owner repo rev hash;};
          };
    }
  );

  mkExtraPluginsLua = extraPlugins:
    lib.pipe extraPlugins [
      (lib.filterAttrs (_: {activate ? false, ...}: activate))
      (lib.mapAttrsToList (
        name: {
          setup ? name,
          settings ? {},
          ...
        }: "require('${setup}').setup(${lib.nixvim.toLuaObject settings})"
      ))
      (builtins.concatStringsSep "\n")
    ];
in {
  inherit mkPluginsList mkExtraPluginsList mkExtraPluginsLua;
}
