{
  config,
  lib,
  pkgs,
  ...
}: let
  args = {inherit config lib pkgs;};
  keymaps = import ./keymaps.nix args;
  plugins = import ./plugins.nix args;
  servers = import ./servers.nix args;
in {
  _module.args.niksvimLib = {
    inherit keymaps plugins servers;

    inherit (keymaps) mkKeymaps mkDisabledKeymaps;
    inherit (plugins) mkPluginsList mkExtraPluginsList mkExtraPluginsLua;
    inherit (servers) mkServersList;
  };
}
