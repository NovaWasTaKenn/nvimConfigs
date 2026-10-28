{
  config.vim.ui = {
    noice = {
      enable = true;
      setupOpts = {
        routes = [
        {
          view = "notify";
          filter = { event = "msg_showmode";};
        }
        ];
        # Disabled: noice highlights the typed command with the "vim" treesitter
        # grammar by default, which throws "Invalid node type" query errors on
        # commands like :s/:substitute because the nixpkgs-pinned vim grammar
        # doesn't match the query files Neovim ships for it.
        cmdline.format.cmdline.lang = false;
      };
    };
  };
}
