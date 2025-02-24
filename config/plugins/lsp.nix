{niksvimLib, ...}: {
  plugins = {
    lsp = {
      enable = true;
      servers =
        (niksvimLib.mkServersList [
          "arduino_language_server"
          "astro"
          "basedpyright"
          "bashls"
          "buf_ls"
          "clangd"
          "cmake"
          "cssls"
          "denols"
          "docker_compose_language_service"
          "dockerls"
          "elixirls"
          "emmet_language_server"
          "eslint"
          "fish_lsp"
          "gitlab_ci_ls"
          "gopls"
          # "graphql"
          "helm_ls"
          "html"
          "htmx"
          "jdtls"
          "jsonls"
          "kotlin_language_server"
          "lua_ls"
          "marksman"
          "nginx_language_server"
          "nim_langserver"
          "nushell"
          "postgres_lsp"
          "sqls"
          "svelte"
          "tailwindcss"
          "ts_ls"
          "volar"
          "yamlls"
          "zls"
        ])
        // {
          nil_ls = {
            enable = true;
            settings.formatting.command = ["nix" "fmt" "--offline" "--" "-"];
          };

          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
            installRustfmt = true;
            settings = {
              completion.callable.snippets = "add_parentheses";
              diagnostics.styleLints.enable = true;
            };
          };
        };
    };
    clangd-extensions.enable = true;
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

  keymaps = niksvimLib.mkKeymaps {
    "<leader>lca" = "<cmd>lua vim.lsp.buf.code_action()<CR>";
    "<leader>lr" = "<cmd>lua vim.lsp.buf.rename()<CR>";
  };
}
