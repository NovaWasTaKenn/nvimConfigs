{
  config = {
    vim = {
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
            "fd"
            "--type"
            "f"
            "--no-ignore-vcs"
            "--color=never"
            "--hidden"
            "--follow"
          ];
        };
      };
      autocomplete.nvim-cmp.enable = true;
      languages = {
        enableLSP = true;
        enableTreesitter = true;
      };
    };
  };
}
