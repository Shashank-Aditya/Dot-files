# My Arch Linux Setup

![My Wallpaper](https://github.com/msrsaditya/dotfiles/blob/main/screenshot.png)

# Philosophy

- Simple, Modern, Minimal and Efficient.
- Software should be tied to as few dependencies as possible.
- No Gimmicky Additions (No Rounded Corners, No transparency, No Compiz, No GIF Wallpapers, No useless cron jobs etc.)
- Using Vanilla Configs with minimal changes to upstream (While still acheiving basic necessary functionality)
- Everything should be as boring and vanilla as possible.
- Focus is on software efficiency and architecture and not on design.
- Tweak once, use forever mindset.
- Using Free and Open Source Software Everywhere.
- Decisions are driven by objectivity and logic.
- Everything is keyboard based, guided by vim bindings.

# Okay, Why Arch?

1. Pure Rolling Release
2. Gives Up-to-Date Packages as Soon as Possible
3. Gives a Barebones Minimal System and Allows the User to Add Whatever the User Sees Necessary on Top of It
4. Large Community of Packages to Install. Everything Everyone Ever Wants (AUR)
5. Binary Distro — Not Source Based
6. Community Maintained and Not Corporate Backed
7. Philosophical Things Like KISS, Vanilla from Upstream, etc. <br><br>
No Linux Distribution single-handedly matches all of this criteria (NixOS is an exception though)

# Installation/Setup
This setup is tailormade for my use. If you want to automatically install everything here without going through the hassle of installing every dependency by hand. <br><br>
Clone this repo (Assuming you already have Git installed in your computer)
```bash
git clone https://github.com/msrsaditya/dotfiles
```
Then give executable permissions to dotfiles.sh script
```bash
sudo chmod +x ~/path/to/dotfiles/dotfiles.sh
```
Finally run the script
```bash
./dotfiles.sh
```
It will automatically install all dependencies, copies all config files, runs systemd commands for starting services, changes shell to zsh, applies tweaks to system and so much more!

# License
This is Licensed Under GPL3. You're free to use this as you see fit.
