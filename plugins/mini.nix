{
  config.vim.mini = {
    surround.enable = true;
    comment.enable = true;
    splitjoin.enable = true;
    operators.enable = true;
    notify = {
      enable = true;
      # Disabled: fires on every LSP progress tick (e.g. basedpyright),
      # which is near-continuous while editing and just noise. noice's
      # own LSP progress popup is disabled too (see plugins/ui.nix).
      setupOpts.lsp_progress.enable = false;
    };
    map.enable = true;
    indentscope.enable = true;
    #cursorword.enable = true;
    # Disabled: duplicated nvim-cmp (the actual completion engine, enabled
    # via vim.autocomplete.nvim-cmp) and auto-popped hover/signature-help
    # floats on a timer while typing. Those are still reachable on demand
    # via the default <leader>lh (hover) / <leader>ls (signature help) keymaps.
    completion.enable = false;
    basics.enable = true;
    ai.enable = true;
    pairs.enable = true;
  };
}
