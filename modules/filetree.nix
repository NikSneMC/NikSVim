{
  vim.filetree = {
    neo-tree = {
      enable = true;
      setupOpts = {
        auto_clean_after_session_restore = true;
        filesystem = {
          filtered_items.visible = true;
          follow_current_file.enabled = true;
        };
        git_status_async = true;
      };
    };
  };
}
