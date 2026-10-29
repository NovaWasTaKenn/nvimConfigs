{...}: {
  imports = [
    ../plugins/git.nix
    ../plugins/mini.nix
    ../plugins/obsidian.nix
    ../plugins/binds.nix
    ../plugins/lsp.nix
    ../plugins/ui.nix
    ../plugins/extra.nix
    ../plugins/harpoon.nix
    ../plugins/theme.nix
    ../plugins/general.nix
    ../plugins/ia.nix
    ./plugins/formatting.nix
    ./plugins/nixlang.nix
    ./plugins/lua.nix
    ./plugins/python.nix
    ./plugins/terraform.nix
  ];
}
