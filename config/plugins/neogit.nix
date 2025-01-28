{niksvimLib, ...}: {
  plugins.neogit.enable = true;

  keymaps = niksvimLib.mkKeymaps {
    "<leader>go" = "<cmd>Neogit<CR>";
  };
}
