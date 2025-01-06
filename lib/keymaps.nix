{lib, ...}: let
  mkKeymaps = lib.mapAttrsToList (
    name: value: let
      keymap = {
        key = name;
        action = value;
        options.silent = true;
      };
    in (
      if builtins.isString value
      then keymap
      else
        (
          keymap
          // value
          // (
            if value ? "mode" && builtins.isString value.mode
            then {mode = lib.stringToCharacters value.mode;}
            else {}
          )
        )
    )
  );
  mkDisabledKeymaps = mode: keymaps:
    mkKeymaps (builtins.listToAttrs (map (key:
      lib.nameValuePair key {
        action = "";
        inherit mode;
      })
    keymaps));
in {
  inherit mkKeymaps mkDisabledKeymaps;
}
