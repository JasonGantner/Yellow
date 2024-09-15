# Yellow Overlay

## What is this overlay ?

The goal of this overlay is to get rid of bloatware associated to X11.
To do so, it provides ebuilds for (lightweight) Wayland native apps and text-only apps that replace libX11 dependant software.

## Testing

I test ebuild on an amd64 + intel i915 platfom with `-X` USE flag and x11-libs/libX11 masked.

Feel free to test on your platform and share the results ;-). 

### KEYWORDS

By default, all ebuilds are created with `KEYWORDS="\~amd64"`

If the software is working as expected on my platform, I might replace "\~amd64" with "amd64".
I might be able to test building for/on AArch64 in the future and thus, depending on the results, add the "\~aarch64" keyword.

## Issues

Issues are opened for :
- bug reports
- update request (a new release from a software is out and I didn't add the corresponding ebuild)
- any other comment you have to make (improvment suggestions,...)

If the issue you encounter is with the software rather than the ebuild, please contact upstream devellopers directly (in respect with their policy).

## Pull requests

You can directly make a pull request for :
- adding your software to the overlay
- providing ebuilds for updates
- anything you dim necessary

## License

All this repository is made available under the GPLv2 license to allow compatibily with the main Gentoo ebuild repository.
Some ebuild are also available under the terms of the ISC License for compatibility with [wayland-desktop](https://github.com/bsd-ac/wayland-desktop). The ebuilds that are available as both ISC or GPLv2 have an ISC License header.
