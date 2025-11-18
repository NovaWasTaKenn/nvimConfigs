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
          pickers.find_files = {
            hidden = true;
            no_ignore = true;
            no_ignore_parent = true;
          };
          pickers.git_files = {
            show_untracked = true;
          };
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
