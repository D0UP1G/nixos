{pkgs, ...}: {
  # Set the default editor to neovim
  home.sessionVariables.EDITOR = "nvim";

  programs.nixvim = {
    enable = true;
    
    globalOpts = {
      number = true;
      shiftwidth = 4;
    };

    globals.mapleader = " ";

    plugins = {
      lualine.enable = true;
      oil.enable = true;
      web-devicons.enable = true;
      treesitter.enable = true;
      commentary.enable = true;
      which-key.enable = true;
      trouble.enable = true;
      otter.enable = true;
      /*
      Dependency for otter
      */
      treesitter.settings.highlight.enable = true;
      autoclose.enable = true;
      instant = {
        enable = true;
        settings.username = "DOUPIG";
      };

      tiny-inline-diagnostic = {
        enable = true;
      };

      alpha = {
        enable = true;
        theme = "dashboard";
      };

      neo-tree = {
        enable = true;
        enableDiagnostics = true;
        enableGitStatus = true;
        enableModifiedMarkers = true;
        enableRefreshOnWrite = true;
        closeIfLastWindow = true;
      };
      notify = {
        enable = true;
        settings = {
          backgroundColour = "#1e1e2e";
          fps = 60;
          settings.render = "default";
          timeout = 500;
          topDown = true;
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
          {name = "emmet_ls";}
          {name = "tailwindcss";}
        ];
        settings.mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.close()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
      };

      telescope = {
        enable = true;
        settings = {
          defaults = {
            file_ignore_patterns = [
              "node_modules"
              ".git"
              "dist"
              "build"
              "target"
              "__pycache__"
              "%.lock"
            ];
          };
        };
      };

      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
          gopls.enable = true;
          pyright.enable = true;
          ts_ls.enable = true;
          # rust_analyzer = {
          # enable = true;
          # installCargo = true;
          # installRustc = true;
          # };
          emmet_ls.enable = true;
          tailwindcss.enable = true;
        };
        keymaps = {
          silent = true;
          lspBuf = {
            gd = "definition";
            gD = "declaration";
            gi = "implementation";
            gr = "references";
            K = "hover";
            "<leader>rn" = "rename";
            "<leader>ca" = "code_action";
          };
        };
      };
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lspFallback = true;
            timeoutMs = 1000;
          };
          formatters_by_ft = {
            go = ["goimports" "gofmt"];
            python = ["black"];
            typescript = ["prettierd"];
            typescriptreact = ["prettierd"];
            javascript = ["prettierd"];
            javascriptreact = ["prettierd"];
            nix = ["alejandra"];
          };
        };
      };
    };

    keymaps = [
      # Telescope
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>fw";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>ff";
      }
      {
        action = "<cmd>Telescope git_commits<CR>";
        key = "<leader>fg";
      }
      {
        action = "<cmd>Telescope oldfiles<CR>";
        key = "<leader>fh";
      }
      {
        action = "<cmd>Telescope colorscheme<CR>";
        key = "<leader>ch";
      }
      {
        action = "<cmd>Telescope man_pages<CR>";
        key = "<leader>fm";
      }
      # Commentary
      {
        action = "<cmd>Commentary<CR>";
        key = "<leader>/";
      }
      # Neotree
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<leader>e";
      }
      # Format code
      {
        action = "<cmd>lua vim.lsp.buf.format()<CR>";
        key = "<leader>lf";
      }
      {
        mode = "n";
        key = "<leader>cf";
        action = ":ConformFormat<CR>";
        options = {
          desc = "Format file";
          silent = true;
        };
      }
    ];
  };
  home.packages = with pkgs; [
    go
    gotools
    black
    prettierd
    alejandra
  ];
}
