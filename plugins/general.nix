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
        setupOpts = {
          defaults = {
            file_ignore_patterns = []; # make sure nothing filters
          };
          pickers.find_files.find_command = [
            "${pkgs.fd}/bin/fd"
            "--type"
            "f"
            "--no-ignore"
            "--color=auto"
            "--hidden"
            "--follow"
          ];
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
