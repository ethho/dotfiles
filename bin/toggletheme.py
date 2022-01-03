#!/usr/bin/python3

from typing import Optional
from dataclasses import dataclass
from subprocess import run, call

DEBUG = False
LIGHT_THEME = "'Adwaita'"
DARK_THEME = "'Gruvbox-Material-Dark'"
LIGHT_BG = 'file:///home/eho/Pictures/wallpapers-exorcist365/gruvbox/skyscraper.jpg'
DARK_BG = 'file:///home/eho/Pictures/wallpapers-exorcist365/gruvbox/leaves-hard.jpg'
MATERIAL_SD = '/usr/share/gnome-shell/extensions/material-shell@papyelgringo/schemas'


@dataclass
class Cmd:
    """
    org.gnome.desktop.interface gtk-theme 'Gruvbox-Material-Dark'
    org.gnome.shell.extensions.user-theme name 'Gruvbox-Material-Dark'
    org.gnome.desktop.background picture-uri 'file:///home/eho/Pictures/wallpapers-exorcist365/gruvbox/leaves-hard.jpg'
    org.gnome.desktop.screensaver picture-uri 'file:///home/eho/Pictures/wallpapers-exorcist365/gruvbox/leaves-hard.jpg'
    org.gnome.shell.extensions.materialshell.theme panel-opacity 0
    org.gnome.shell.extensions.materialshell.theme primary-color '#282828'
    org.gnome.shell.extensions.materialshell.theme theme 'dark'
    """
    category: str
    setting: str
    value: Optional[str] = None
    schemadir: Optional[str] = None
    base: str = 'gsettings'
    debug: bool = DEBUG

    def __call__(self):
        self.run()

    def run(self):
        args = [self.base, 'get', self.category, self.setting]
        if self.value is not None:
            args[1] = 'set'
            args.append(str(self.value))
        else:
            args[1] = 'get'
            raise NotImplementedError()
        if self.schemadir is not None:
            args = [args[0]] + ['--schemadir', self.schemadir] + args[1:]
        if self.debug:
            print(" ".join(str(a) for a in args))
        _ = run(args)



def toggle_dark():
    assert 'dark' in DARK_THEME.lower()
    proc = run(["gsettings", "get", "org.gnome.desktop.interface", "gtk-theme"], capture_output=True)
    islight = 'dark' not in proc.stdout.decode('utf-8').strip().lower()

    if islight:
        # switch to dark
        theme = DARK_THEME
        material_theme = 'dark'
        bg = DARK_BG
        panel_opacity = 0
        primary_color = '#282828'
    else:
        # switch to light
        theme = LIGHT_THEME
        material_theme = 'light'
        bg = LIGHT_BG
        panel_opacity = 100
        primary_color = '#ffffff'

    Cmd("org.gnome.desktop.interface", "gtk-theme", theme).run()
    Cmd("org.gnome.shell.extensions.user-theme", "name", theme).run()
    Cmd("org.gnome.desktop.background", "picture-uri", bg).run()
    Cmd("org.gnome.desktop.screensaver", "picture-uri", bg).run()
    Cmd("org.gnome.shell.extensions.materialshell.theme", "theme", material_theme, MATERIAL_SD).run()
    Cmd("org.gnome.shell.extensions.materialshell.theme", "panel-opacity", panel_opacity, MATERIAL_SD).run()
    Cmd("org.gnome.shell.extensions.materialshell.theme", "primary-color", primary_color, MATERIAL_SD).run()


def main():
    toggle_dark()


if __name__ == "__main__":
    main()

