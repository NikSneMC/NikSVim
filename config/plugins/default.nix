{niksvimLib, ...}: let
  extraPlugins = {
    neotree-file-nesting-config = {
      owner = "saifulapm";
      rev = "d9168eed2522397d271624e5f523d8384a552a64";
      hash = "sha256-qaB60iMLkuN5N9gnAJ2QHFmimlxTnBNlNqv6Zfb3aHg=";
    };
  };
in {
  imports = [
    ./cmp
    ./barbar.nix
    ./colorizer.nix
    ./dap.nix
    ./dashboard.nix
    ./indent-blankline.nix
    ./lsp.nix
    ./lualine.nix
    ./multicursors.nix
    ./neo-tree.nix
    ./neocord.nix
    ./neogit.nix
    ./neotest.nix
    ./project-nvim.nix
    ./refactoring.nix
    ./telescope.nix
    ./toggleterm.nix
    ./treesitter.nix
    ./which-key.nix
  ];

  plugins = niksvimLib.mkPluginsList [
    "comment"
    "direnv"
    "emmet"
    "friendly-snippets"
    "git-conflict"
    "gitblame"
    "gitlinker"
    "gitmessenger"
    "gitsigns"
    "luasnip"
    "markdown-preview"
    "nix"
    "nix-develop"
    "nvim-autopairs"
    "nvim-surround"
    "rainbow-delimiters"
    "rest"
    "todo-comments"
    "ts-autotag"
    "wakatime"
    "web-devicons"
  ];
  extraPlugins = niksvimLib.mkExtraPluginsList extraPlugins;

  extraConfigLua = niksvimLib.mkExtraPluginsLua extraPlugins;
}
