{
  description = "Small tools for a sweeter Nix Flakes experience";
  
  outputs = { self }: {
    shellHook = {
      welcome = ''
        echo -e "Entering dev shell for $(basename "$(pwd)")..."
      '';
      listPkgs = ''
        echo "Installed nix packages:"
        for path in ${builtins.concatStringsSep " " packages}; do
          pkg=$(basename "$path" | awk -F '-' '{print substr($0, index($0, $2))}')
          echo -e "\t$pkg"
        done
        echo
      '';
    };
  };
}
