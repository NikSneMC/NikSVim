{
  config,
  lib,
  niksvimLib,
  ...
}: {
  programs.nixvim.keymaps = builtins.concatLists (lib.optional config.programs.niksvim.disableArrowKeys (niksvimLib.mkDisabledKeymaps "inv" [
    "<Up>"
    "<Down>"
    "<Left>"
    "<Right>"
  ]));
}
