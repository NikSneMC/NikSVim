{
  plugins = {
    windsurf-nvim = {
      enable = true;
      settings.enable_chat = true;
    };
    cmp.settings.sources = [{name = "windsurf";}];
  };
}
