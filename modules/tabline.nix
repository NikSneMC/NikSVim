{
  vim.tabline = {
    nvimBufferline = {
      enable = true;
      mappings = {
        closeCurrent = "<A-c>";
        cycleNext = "<A-.>";
        cyclePrevious = "<A-,>";
        moveNext = "<A-s-.>";
        movePrevious = "<A-s-,>";
      };
      setupOpts = {
        options.numbers = "ordinal";
      };
    };
  };
}
