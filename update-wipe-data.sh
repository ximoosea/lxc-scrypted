systemctl stop scrypted

# pull latest image
cd ~/.scrypted
docker compose pull

# bring the container up to ensure it does not get pruned
docker compose up -d

# prune everything not in use
docker container prune -f
docker image prune -a -f

# container down to since systemctl will bring it back up
docker compose down

# clear out the db and any bash history
rm -rf ~/.scrypted/volume/* ~/.npm ~/.cache ~/.launchpadlib ~/.local ~/.python_history

echo "Restart the LXC."

echo "" > ~/.bash_history

