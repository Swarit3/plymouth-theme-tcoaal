# plymouth-theme-tcoaal

A Plymouth boot theme based on The Coffin of Andy and Leyley that tries to be seamless and use BGRT if possible.

Psst. AMD GPU?
You might wanna add
- amdgpu driver to mkinitcpio MODULES
- and add amdgpu.seamless=1 to GRUB commandline or systemd-boot entry options for a flicker-free, Windows-like perfect seamless orgasm inducing boot.

~btw, I know there is no keyboard input function. so if you have encrypted rootfs and no TPM autounlock... I'm sorry :(~
yessirreee I added prompt and shit
(I'll add it maybe probably some day. life is hard. this is just extra unpaid labor.)

## Preview
![screenshot](/screenshots/boot.jpeg)
![screenshot](/screenshots/question.jpeg)

![previews](/screenshots/SHOWCASE.md)

## Features
it's a boot animation. what do you want? ray tracing?
we have BGRT support, and random. everything is randomized.

all 100% pure nemlie's assets taken from the game. _(please don't sue me Kit9!!)_
all images hand-plucked from The Coffin of Andy and Leyley. Not a single thing I made except for the `W` in Shutdo*w*n text message.
In my defense, I couldn't find any hand image letter `W` in the game.

## Dependencies
- plymouth (duh!)
- imagemagick (for bgrt conversion. You need this for automatic install)
- bc (You need this for automatic install)

you also need Gloria Hallelujah theme installed. (You can get it from Google Fonts)

## Installation
First order of business is to get the dependencies.
```bash
# Arch Linux and any derivates
sudo pacman -S plymouth imagemagick bc --needed
```
```
# Debian / Ubuntu and any derivates
sudo apt install plymouth imagemagick bc
```
```
# Fedora and any derivates
sudo dnf install plymouth ImageMagick bc
```
```
# openSUSE and any derivates
sudo zypper install plymouth ImageMagick bc
```
```
# Alpine Linux and any derivates
sudo apk add plymouth imagemagick bc
```
```
# Gentoo and any derivates
sudo emerge app-boot/plymouth media-gfx/imagemagick sys-devel/bc
```

Now, for the actual theme, there's two ways.

- You can either copy this and paste it in terminal:
```bash
git clone https://github.com/Swarit3/plymouth-theme-tcoaal && cd plymouth-theme-tcoaal && chmod 755 ./install.sh && sudo sh ./install.sh
```
- Or, you can manually do the following:
	- clone this repo
	- copy GloriaHallelujah-Regular.ttf to `/usr/share/fonts/`
	- copy the tcoaal directory to `/usr/share/plymouth/themes/tcoaal`
	- get your bgrt, convert to png, and put it in the theme directory. (You can use anything else instead of BGRT, too. Just make sure file can be read by plymouth)
	- edit tcoaal.script and change bgrt_x1 and bgrt_y1 to match the firmware given offsets
	> (you can find hardcoded pixel value in `/sys/firmware/acpi/bgrt/xoffset` and `yoffset` and divide them by screen height and width in pixels to get bgrt_x1 and bgrt_y1.)
	- Now you can set this as the plymouth theme and regenerate initcpio.

The installer will:
- Auto-detect your BGRT and screen resolution
- Convert and place assets
- Optionally set as default theme and regenerate initcpio
- If it can't find your BGRT and asks you for an offset, you can give it 0.5 for strike in the middle of the screen, and 1 or 0 for the very edge. The counting starts from top left.

But the installer is written by me and not well tested. if it messes up the image positioning or anything else... it's wholly my fault and pls open an issue if you want or just manually install.
