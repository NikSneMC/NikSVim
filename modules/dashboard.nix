{
  vim.dashboard = {
    dashboard-nvim = {
      enable = true;
      setupOpts = {
        change_to_vcs_root = true;
        config = {
          footer = [
            "Made by NikSne with ❤️"
          ];
          header = [
            "███╗   ██╗██╗██╗  ██╗███████╗██╗   ██╗██╗███╗   ███╗"
            "████╗  ██║██║██║ ██╔╝██╔════╝██║   ██║██║████╗ ████║"
            "██╔██╗ ██║██║█████╔╝ ███████╗██║   ██║██║██╔████╔██║"
            "██║╚██╗██║██║██╔═██╗ ╚════██║╚██╗ ██╔╝██║██║╚██╔╝██║"
            "██║ ╚████║██║██║  ██╗███████║ ╚████╔╝ ██║██║ ╚═╝ ██║"
            "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
          ];
          mru = {
            cwd_only = true;
            label = "Recently opened files in current directory";
            limit = 20;
          };
          packages.enable = false;
          project = {
            action = "Neotree dir=";
            limit = 10;
          };
          shortcut = [
            {
              desc = "[  NikSneMC/NikSVim]";
              group = "DashboardShortCut";
            }
          ];
          week_header.enable = false;
        };
        theme = "hyper";
      };
    };
  };
}
