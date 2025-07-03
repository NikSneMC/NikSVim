{pkgs, ...}: {
  vim.treesitter = {
    enable = true;
    autotagHtml = true;
    context.enable = true;
    fold = true;
    textobjects.enable = true;
    grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      tmux
    ];
  };
}
