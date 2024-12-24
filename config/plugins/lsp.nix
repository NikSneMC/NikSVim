{lib, ...}: let
  niksvimLib = import ../../lib {inherit lib;};
in {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers =
        (niksvimLib.mkServersList [
          "arduino_language_server"
          "astro"
          "basedpyright"
          "clangd"
          "cmake"
          "cssls"
          "docker_compose_language_service"
          "dockerls"
          "elixirls"
          "eslint"
          "gopls"
          "graphql"
          "html"
          "htmx"
          "jdtls"
          "jsonls"
          "kotlin_language_server"
          "lua_ls"
          "marksman"
          "nginx_language_server"
          "nim_langserver"
          "postgres_lsp"
          "sqls"
          "svelte"
          "tailwindcss"
          "yamlls"
          "zls"
        ])
        // {
          nil_ls = {
            enable = true;
            settings.formatting.command = ["alejandra"];
          };
        };
    };
    clangd-extensions.enable = true;
    rustaceanvim = {
      enable = true;
      settings.server = {
        load_vscode_settings = true;
      };
    };
    typescript-tools.enable = true;
    lsp-format.enable = true;
    lsp-lines.enable = true;
    lspkind = {
      enable = true;
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
      symbolMap = {
        Codeium = "";
      };
    };
  };
}
