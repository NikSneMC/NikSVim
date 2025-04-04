let
  mkSources = map (source: {
    name = source;
  });
in {
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.close()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
        sources = mkSources [
          "sql"
          "cmp_bootstrap"
          "fonts"
          "scss variables"
          "sass variables"
          "css variables"
          "dotenv"
          "crates"
          "pypi"
          "go packages"
          "npm"
          "fish"
          "kitty"
          "nvim_lsp_document_symbol"
          "nvim_lsp_signature_help"
          "nvim_lsp"
          "cmp_lsp_rs"
          "treesitter"
          "async_path"
          "buffer"
          "git"
          "conventionalcommits"
          "nixpkgs_maintainers"
          "emoji"
          "nerdfont"
          "greek"
          "latex_symbols"
        ];
      };
    };
    cmp-conventionalcommits.enable = true;
    cmp-nixpkgs-maintainers.enable = true;
  };
}
