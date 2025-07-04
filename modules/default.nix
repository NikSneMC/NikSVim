{
  imports = [
    ./keymaps
    ./languages
    ./ui
    ./utility
    ./visuals
    ./autocomplete.nix
    ./autopairs.nix
    ./binds.nix
    ./clipboard.nix
    ./comments.nix
    ./dashboard.nix
    ./debugger.nix
    ./diagnostics.nix
    ./filetree.nix
    ./formatter.nix
    ./fzf-lua.nix
    ./git.nix
    ./lsp.nix
    ./navigation.nix
    ./notes.nix
    ./notify.nix
    ./presence.nix
    ./projects.nix
    ./runner.nix
    ./session.nix
    ./snippets.nix
    ./spellcheck.nix
    ./statusline.nix
    ./tabline.nix
    ./telescope.nix
    ./terminal.nix
    ./theme.nix
    ./treesitter.nix
  ];

  vim = {
    enableLuaLoader = true;
    lineNumberMode = "relNumber";
    options = {
      shiftwidth = 4;
      tabstop = 4;
    };
    syntaxHighlighting = true;
    undoFile.enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
  };
}
