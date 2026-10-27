{
  config.vim.lsp = {
    enable = true;
    lspkind.enable = true;
    #lsplines.enable = true;
    lightbulb.enable = true;
    # Disabled: popped up a signature-help float on every keystroke while
    # typing a call. Signature help is still available on demand via the
    # default <leader>ls keymap (vim.lsp.buf.signature_help).
    lspSignature.enable = false;
  };
}
