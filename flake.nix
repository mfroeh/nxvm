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
    in
    {
      packages = nixpkgs.lib.genAttrs systems (system: {
        default = nixvim.legacyPackages.${system}.makeNixvimWithModule {
          pkgs = import nixpkgs { inherit system; };
          module = { colorschemes.gruvbox.enable = true; };
          extraSpecialArgs = {};
        };
      });
    };
}
