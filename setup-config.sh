#!/bin/bash

# Map of configurations: source => destination
declare -A CONFIG_MAP=(
  ["nvim"]="$HOME/.config/nvim"
  [".tmux.conf"]="$HOME/.tmux.conf"
  # Add more mappings here as needed
  # Example:
  # ["i3"]="$HOME/.config/i3"
  # [".bashrc"]="$HOME/.bashrc"
)

# Variables
DOTFILES_DIR="$HOME/github/dotfiles"  # Path to your dotfiles repository
BACKUP_DIR="$HOME/.config-backup"  # Backup directory for existing configs

# Step 1: Create backup and pack directories
echo "Creating backup directory at $BACKUP_DIR..."
mkdir -p "$BACKUP_DIR"


# Step 2: Process each configuration in the map
for config in "${!CONFIG_MAP[@]}"; do
  dest_path="${CONFIG_MAP[$config]}"
  config_name=$(basename "$config")

  # Step 2.1: Backup existing config
  if [ -e "$dest_path" ]; then
    echo "Backing up $dest_path to $BACKUP_DIR..."
    mv "$dest_path" "$BACKUP_DIR/"
  fi

  # Step 2.3: Create symbolic link
  echo "Linking $PACK_DIR/$config_name to $dest_path..."
  ln -s "$PACK_DIR/$config_name" "$dest_path"
done

echo "Setup complete! Your configurations are now organized and linked."
