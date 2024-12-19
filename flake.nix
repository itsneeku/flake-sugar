{
  description = "Small tools for sweeter flakes";

  outputs = {
    welcome = ''
      printf "
      🔨 Entering Shell for $(basename "$(pwd)")

      📦 Installed nix packages:
      $(for path in ${builtins.concatStringsSep " " (map (pkg: "${pkg}") devDeps)}; do
        pkg=$(basename "$path" | awk -F '-' '{print substr($0, index($0, $2))}')
        echo -e "\t$pkg"
      done)

      "
    '';
  };
}
