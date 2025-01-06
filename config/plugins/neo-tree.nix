{niksvimLib, ...}: {
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      filesystem = {
        filteredItems.visible = true;
        followCurrentFile.enabled = true;
      };
      nestingRules.__raw = "require('neotree-file-nesting-config').nesting_rules";
    };

    keymaps = niksvimLib.mkKeymaps {
      # neo-tree
      "<C-n>" = "<cmd>Neotree toggle<CR>";
      "<leader>e" = "<cmd>Neotree focus<CR>";
    };
  };
}
