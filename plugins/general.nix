{
  pkgs,
  lib,
  ...
}: {
  config = {
    vim = {
      # nvf's legacy `vim.maps.<mode>` options no longer have a `{}` default;
      # this repo only uses `vim.keymaps`, so stub them out to avoid eval errors.
      maps = lib.genAttrs [
        "normal"
        "insert"
        "select"
        "visual"
        "terminal"
        "normalVisualOp"
        "visualOnly"
        "operator"
        "insertCommand"
        "lang"
        "command"
      ] (_: lib.mkDefault {});

      withPython3 = true;
      viAlias = false;
      vimAlias = true;
      statusline.lualine.enable = true;
      telescope = {
        enable = true;
        setupOpts = let
          # Heavy/noise directories to always skip, regardless of .gitignore
          # (fd/rg still respect .gitignore for everything else, so we use
          # --no-ignore-vcs below instead of plain --hidden: that's what lets
          # gitignored-but-useful dotfiles like .env/.envrc stay navigable,
          # while these specific dirs stay excluded no matter what).
          excludeDirs = [
            ".git"
            # python
            "venv"
            ".venv"
            "__pycache__"
            ".mypy_cache"
            ".pytest_cache"
            ".ruff_cache"
            ".tox"
            # node/js
            "node_modules"
            "dist"
            "build"
            # rust / nix result
            "target"
            "result"
            # go
            "vendor"
            # scala (sbt/bloop/metals)
            ".bloop"
            ".metals"
            ".ammonite"
            ".bsp"
            # terraform
            ".terraform"
            # ansible
            ".ansible"
            # powershell/.net build output
            "obj"
            "bin"
          ];
        in {
          defaults = {
            vimgrep_arguments =
              [
                "${pkgs.ripgrep}/bin/rg"
                "--color=never"
                "--no-heading"
                "--with-filename"
                "--line-number"
                "--column"
                "--smart-case"
                "--hidden"
                "--no-ignore-vcs"
              ]
              ++ builtins.concatMap (d: ["-g" "!${d}/"]) excludeDirs;
          };
          pickers.find_files.find_command =
            [
              "${pkgs.fd}/bin/fd"
              "--type"
              "f"
              "--color=auto"
              "--hidden"
              "--follow"
              "--no-ignore-vcs"
            ]
            ++ builtins.concatMap (d: ["-E" d]) excludeDirs;
        };
      };
      autocomplete.nvim-cmp.enable = true;
      lsp.enable = true;
      languages = {
        enableTreesitter = true;
      };
    };
  };
}
