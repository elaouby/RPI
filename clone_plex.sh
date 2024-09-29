#!/bin/bash

SOURCE="/media/admin/Plex/"
DESTINATION="/media/admin/Plex_20TB/"

# Run the rsync command
sudo rsync -av --progress --partial --inplace "$SOURCE" "$DESTINATION"

# Verify the copy
sudo rsync -avn "$SOURCE" "$DESTINATION"
