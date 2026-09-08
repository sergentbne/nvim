{
  description = "serge's own nvim configuration";
  #based on voidarc nix configuration: git.voidarc.co.uk/voidarc/nvim
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs =
    {
      self,
      nixpkgs,
      rust-overlay,
      ...
    }@inputs:
    let
      # Define the systems you want to support
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      #rust overlay for simple rust management (blink.cmp requires it)
      overlays = [ (import rust-overlay) ];
      # A helper function to generate outputs for each system
      # It imports nixpkgs for the system and passes the resulting 'pkgs' to the function 'f'
      forAllSystems =
        f: nixpkgs.lib.genAttrs supportedSystems (system: f (import nixpkgs { inherit system overlays; }));
    in
    {
      # Use the helper to generate the packages attribute for every system
      packages = forAllSystems (
        pkgs:
        let
          pkgList = with pkgs; [
            lua-language-server
            basedpyright
            typescript-go
            ruff
            clang
            rust-analyzer
            tree-sitter
            nixfmt
            rust-bin.stable.latest.default
          ];
        in
        {
          # Define the default package for this system
          default = inputs.wrappers.wrappers.neovim.wrap {
            inherit pkgs;
            env = {
              "CONFIG_ROOT" = ./.;
              "NVIM_APPNAME" = "nvim-serge";
            };
            runtimePkgs = pkgList;
            settings.config_directory = ./.;
          };
        }
      );
    };
}
