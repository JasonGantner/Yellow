#Yellow Overlay
## What is this overlay ?
The goal of this overlay is to get rid of bloatware associated to X11.
To do so, it provides ebuids for Wayland native apps and text-only apps that replace X11-only software.

## Testing
I test ebuild on an amd64 + intel i915 platfom with `-X` USE flag and x11-libs/libX11 masked.
Testing on other platforms is would be very appreciated.

## Isses
Issues are opened for :
- bug reports
- software addition request (yours or one you'd like to use). Don't ask "Can you port XXX to Wayland", I will likely not have the time and/or skill. 
- update request (a new release from a software is out and I didn't add the corresponding ebuild)
- any other comment you have to make (improvment suggestions,...)

If the issue you encounter is with the software rather than the ebuild, please contact upstream devellopers directly(in respect with their policy).

## Pull requests
You can directly make a pull request for :
- adding your software to the overlay
- providing ebuild for an update
- anything you dim necessary
