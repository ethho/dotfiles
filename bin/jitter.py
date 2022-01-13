#!/usr/bin/python3

import pyautogui as pag


def main():
    try:
        while True:
            pag.moveRel(20, 20, 3)
            pag.moveRel(-20, -20, 3)
    except KeyboardInterrupt:
        pass


if __name__ == "__main__":
    main()
