# plymouth-theme-tcoaal

A Plymouth boot theme based on The Coffin of Andy and Leyley that tries to be seamless and use BGRT if possible.

Psst. AMD GPU?
You might wanna add
- amdgpu driver to mkinitcpio MODULES
- and add amdgpu.seamless=1 to GRUB commandline or systemd-boot entry options for a flicker-free, Windows-like perfect seamless orgasm inducing boot.

btw, I know there is no keyboard input function. so if you have encrypted rootfs and no TPM autounlock... I'm sorry :(
(I'll add it maybe probably some day. life is hard. this is just extra unpaid labor.)

## Preview
![screenshot](screenshots/boot.img)
![screenshot](screenshots/shutdown.img)

## Features
it's a boot animation. what do you want? ray tracing?
we have BGRT support, and random.

all 100% pure nemlie's assets taken from the game. (please don't sue me Kit9!!)
Pictures sourced from The Coffin of Andy and Leyley. Not a single thing I made except for the `W` in Shutdown text.
In my defense, I couldn't find any hand written letter `W` in the game.

## Dependencies
- plymouth (duh!)
- imagemagick (for bgrt conversion. You need this for automatic install)
- bc (You need this for automatic install)

## Installation
Look. There's two ways.
- You can either run as root `install.sh`
- Or, you can manually do the following:
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
