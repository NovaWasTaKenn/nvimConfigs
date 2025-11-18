{
  config.vim.binds = {
    cheatsheet.enable = true;
    whichKey.enable = true;
  };

  config.vim.keymaps = [
    {
      key = "<leader>lfj";
      mode = "n";
      silent = false;
      action = ":%!jq .<CR>";
    }
    {
      key = "<leader>p";
      mode = "n";
      silent = false;
      action = ":bprevious<CR>";
    }
    {
      key = "<leader>n";
      mode = "n";
      silent = false;
      action = ":bnext<CR>";
    }
    {
      key = "<leader>tf";
      mode = "n";
      silent = false;
      lua = true;
      action = ''        function()
                -- If autoformat is currently disabled for this buffer,
                -- then enable it, otherwise disable it
                if vim.b.disable_autoformat then
                  vim.b.disable_autoformat = false
                  vim.notify 'Enabled autoformat for current buffer'
                else
                  vim.b.disable_autoformat = true
                  vim.notify 'Disabled autoformat for current buffer'
                end
              end'';
    }
    {
      key = "<leader>tF";
      mode = "n";
      lua = true;
      silent = false;
      action = ''        function()
                -- If autoformat is currently disabled globally,
                -- then enable it globally, otherwise disable it globally
                if vim.g.disable_autoformat then
                  vim.g.disable_autoformat = false
                  vim.notify 'Enabled autoformat globally'
                else
                  vim.g.disable_autoformat = true
                  vim.notify 'Disabled autoformat globally'
                end
              end'';
    }
  ];
}
