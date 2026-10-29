{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

          # Required, nvf works best and only directly supports flakes
    nvf = {
      url = "github:notashelf/nvf";

      # You can override the input nixpkgs to follow your system's
      # instance of nixpkgs. This is safe to do as nvf does not depend
      # on a binary cache.
      inputs.nixpkgs.follows = "nixpkgs";
      # Optionally, you can also override individual plugins
      # for example:
      #inputs.obsidian-nvim.follows = "obsidian-nvim"; # <- this will use the obsidian-nvim from your inputs
    };
  };

  outputs = inputs @ {...}: let
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    nvimConfig = import ./profiles/nvim.nix {
      lib = pkgs.lib;
      pkgs = pkgs;
    };

    nvim = inputs.nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [nvimConfig];
    };
  in {
    packages.${system} = {
      nvim = nvim.neovim;
      default = nvim.neovim;
    };
  };
}
