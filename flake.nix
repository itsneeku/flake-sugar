{
  description = "Small tools for sweeter flakes";

  outputs =
    { ... }:
    {
      welcome = packages: ''
        echo -e "\nEntering dev shell for $(basename "$(pwd)")..."
        echo "Installed nix packages:"
        for path in ${builtins.concatStringsSep " " packages}; do
          pkg=$(basename "$path" | awk -F '-' '{print substr($0, index($0, $2))}')
          echo -e "\t$pkg"
        done
        echo
      '';
    };
}
