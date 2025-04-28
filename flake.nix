{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { nixpkgs, nixvim, ... }@inputs:
    let
      systems = [ "aarch64-darwin" "x86_64-linux" ];

      mkPkgs = system: import nixpkgs { inherit system; };

      mkNixvim = system: nixvim.legacyPackages.${system}.makeNixvimWithModule {
          pkgs = mkPkgs system;
          module = import ./config;
          extraSpecialArgs = {};
      };
    in
    {
      packages = nixpkgs.lib.genAttrs systems (system: rec {
        pkgs = mkPkgs system;
        nvim = mkNixvim system;
        default = nvim;
        nvide = pkgs.writeShellScriptBin "nvide" ''
          exec ${pkgs.neovide}/bin/neovide --neovim-bin ${nvim}/bin/nvim
        '';
      });
    };
}
