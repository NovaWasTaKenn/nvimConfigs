{pkgs, ...}: {
  config.vim.languages.enableFormat = true;
  config.vim.lsp.formatOnSave = false;
  config.vim.options = {
    tabstop = 4;
    shiftwidth = 4;
  };
  config.vim.extraPlugins = {
    conform = {
      package = pkgs.vimPlugins.conform-nvim;
    };
  };
  config.vim.formatter.conform-nvim = {
    enable = true;
  };
}
