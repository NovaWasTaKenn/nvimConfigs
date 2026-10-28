{
  config.vim.languages.python.enable = true;
  config.vim.languages.python.format.enable = false;

  # basedpyright's node runtime fails to start when opened inside a project's
  # direnv shell (e.g. tada-shell) that exports LD_LIBRARY_PATH with its own
  # libstdc++: the shell's lib shadows the one basedpyright's nix closure was
  # built against, so node can't find the CXXABI symbols its icu4c needs.
  # Clearing it for this one LSP process lets node fall back to its own RPATH.
  config.vim.lsp.servers.basedpyright.cmd_env.LD_LIBRARY_PATH = "";
}
