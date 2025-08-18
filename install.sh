#/bin/sh

# builds with my flakes
sudo nixos-rebuild switch --flake .#pedropc --impure

# For adding the miku cursor
ln -s /home/$USER/Nix-Config/assets/miku-cursor-linux ~/.local/share/icons # Remeber how does Symbolic Links work

# overwriting my own dotfiles in the config dir

# cloning the repo
git clone https://github.com/PeDro0210/Synthwave-Nix-Flakes.git

# moving the dotfiles
mv Synthwave-Nix-Flakes/* ~/.config/*

# Putting wallpapers

# getting the monitors and parsing for spaces
raw_monitor_info=$(hyprctl monitors | awk "/[\w]*-[0-9]/" | tr " " "\n")

raw_monitor_idx=0

# the ${raw_monitor_info} is for the size
for monitor_name in $raw_monitor_info;
do

  # for having a track for the number of monitor your iwn
  ((raw_monitor_idx+=1))

  echo $raw_monitor_idx

  if [ $raw_monitor_idx == 2 ]; then
    echo "$monitor_name"

    swww img -o $monitor_name ~/Pictures/WallPapers/WallPaper2.gif
    raw_monitor_idx=-2 # for getting just the value in 2 mod 4
  fi

done

echo "Enjoy the dotfiles :D"
echo "System reboting in 10 s"
echo "The reboot is for having effect in the things"

sleep 10

systemctl reboot


