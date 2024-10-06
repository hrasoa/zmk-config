{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    python310
    python310Packages.pip
    python310Packages.virtualenv
    pipx
  ];

  shellHook = ''
    # Create a virtual environment if it doesn't exist
    if [ ! -d "venv" ]; then
      python -m venv venv
    fi
    
    # Activate the virtual environment
    source venv/bin/activate

    # Install ZMK CLI if not already installed
    if ! command -v zmk &> /dev/null; then
      pipx install zmk
    fi

    # Add pipx binary path to PATH
    export PATH=$PATH:~/.local/bin

    echo "ZMK CLI environment is ready!"
  '';
}