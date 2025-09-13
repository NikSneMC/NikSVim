{
  vim.keymaps = [
    {
      key = "<C-n>";
      mode = "";
      silent = true;
      action = "<cmd>Neotree toggle<CR>";
    }
    {
      key = "<leader>e";
      mode = "";
      silent = true;
      action = "<cmd>Neotree focus<CR>";
    }
  ];
}
