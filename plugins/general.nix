{
  config = {
    vim = {
      withPython3 = true;
      options = {
        tabstop = 2;
        shiftwidth = 2;
      };
      viAlias = false;
      vimAlias = true;
      statusline.lualine.enable = true;
 telescope = {
        enable = true;
        setupOpts.defaults.vimgrep_arguments = [
          "\${pkgs.ripgrep}/bin/rg"
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
          "--hidden"
          "--no-ignore"
          "\${pkgs.ripgrep}/bin/rg"
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
          "--hidden"
          "--no-ignore"
          "--no-ignore-vcs"
        ];
      };
      autocomplete.nvim-cmp.enable = true;
      languages = {
        enableLSP = true;
        enableTreesitter = true;
      };
    };
  };
}
