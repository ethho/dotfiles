#!/usr/bin/python3

from subprocess import call


def set_suspend(val: bool = True, mode: str = 'ac'):
    """
    gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
    gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'suspend'
    gsettings set org.gnome.desktop.session idle-delay 'uint32 0'
    gsettings set org.gnome.settings-daemon.plugins.power idle-brightness 30
    """
    assert mode in ('battery', 'ac')
    if val is True:
        setting = "suspend"
        idle_delay = '300'
        idle_brightness = '30'
    else:
        setting = "nothing"
        idle_delay = '0'
        idle_brightness = '1'
    _ = call(["gsettings", "set", "org.gnome.settings-daemon.plugins.power", f"sleep-inactive-{mode}-type", f"'{setting}'"])
    _ = call(["gsettings", "set", "org.gnome.desktop.session", "idle-delay", f"uint32 {idle_delay}"])
    _ = call(["gsettings", "set", "org.gnome.settings-daemon.plugins.power", "idle-brightness", idle_brightness])


def main():
    try:
        set_suspend(False, 'ac')
        while True:
            pass
    except KeyboardInterrupt:
        pass
    finally:
        set_suspend(True, 'ac')



if __name__ == "__main__":
    main()
