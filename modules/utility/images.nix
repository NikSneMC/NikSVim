{
  vim.utility.images = {
    image-nvim = {
      enable = true;
      setupOpts = {
        backend = "kitty";
        integrations = {
          markdown = {
            enable = true;
            downloadRemoteImages = true;
          };
          neorg = {
            enable = true;
            downloadRemoteImages = true;
          };
        };
      };
    };
  };
}
