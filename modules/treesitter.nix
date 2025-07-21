{pkgs, ...}: {
  vim.treesitter = {
    enable = true;
    autotagHtml = true;
    context = {
      enable = true;
      setupOpts.max_lines = 3;
    };
    fold = true;
    textobjects.enable = true;
    grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      tmux
    ];
  };
}
