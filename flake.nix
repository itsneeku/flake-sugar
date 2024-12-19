{
  description = "Small tools for sweeter flakes";

  outputs = {
    welcome = packages: ''
      printf "
      🔨 Entering Shell for $(basename "$(pwd)")

      📦 Installed nix packages:
      $(for path in ${builtins.concatStringsSep " " (map (pkg: "${pkg}") packages)}; do
        pkg=$(basename "$path" | awk -F '-' '{print substr($0, index($0, $2))}')
        echo -e "\t$pkg"
      done)

      "
    '';
  };
}
