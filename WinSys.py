#!/usr/bin/env python

# Custom License Based on MIT License
# WinSystem  : personal computer assistant
# Version    : 1
# Github     : https://github.com/wsl-iq/WinSystem
# Developer  : Mohammed Al-Baqer

'''

                              Copyright (c) 2025
                              Version 1, 8 April 2025
                              Developer: Mohammed Al-Baqer

[ Preamble ]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to use,
modify, and distribute modified versions of the Software **for personal or educational purposes only**, 
provided that the following conditions are met:

1. The Software **may not be used, sold, or resold for commercial purposes** in any form, whether directly or indirectly.
2. This copyright notice must be retained in all copies and significant modifications.
3. Any modified version must acknowledge the original developer.
4. Unauthorized distribution of the original or modified versions **for financial gain** is strictly prohibited.
5. This license does not grant permission to use the Software for any illegal activities.
6. The developer is not responsible for providing ongoing support, updates, or maintenance.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHOR OR COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES, OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT, OR OTHERWISE, ARISING FROM, OUT OF, OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

'''

import os, sys
from WinCPU import SelCPU
from WinGPU import SelGPU
from UnlockSpeed import Run
from BIOS import BIOS
from FixBug import FixBug

R = "\033[91;1m"  # Red
G = "\033[92;1m"  # Green
B = "\033[94;1m"  # Blue
Y = "\033[93;1m"  # Yellow
C = "\033[96;1m"  # Cyan
M = "\033[95;1m"  # Magenta
W = "\033[97;1m"  # White
D = "\033[90;1m"  # Grey
S = "\033[0m"     # Reset

Enter = "\033[94;1m" + "[" + "\033[92;1m" + "+" + "\033[94;1m" + "]" + "\033[92;1m"

def WinSys():
    try:
        os.system('cls' if os.name == 'nt' else 'clear')
        print(rf'''
 {G}__      ___       {Y}___         
 {G}\ \    / (_)_ _  {Y}/ __|_  _ ___
  {G}\ \/\/ /| | ' \ {Y}\__ \ || (_-<
   {G}\_/\_/ |_|_||_|{Y}|___/\_, /__/
                       {Y}|__/ 
        {R}Version {W}: {B}1
        {M}Developer {W}: {C}Mohammed Al-Baqer    
{W}''')
        print(f'{G}[1] {B}Boot Optimization{W}\n{G}[2] {B}Clean Hard Disk{W}\n{G}[3] {B}Clean or Clear Memory Ram{W}\n{G}[4] {B}Close App Background{W}')
        print(f'{G}[5] {B}Super CPU{W}\n{G}[6] {B}Processor optimization CPU{W}\n{G}[7] {B}Optimize Graphics GPU{W}\n{G}[8] {B}Overclocking{W}\n{G}[9] {B} Open BIOS{W}\n{G}[10] Fix Bug Files System{W}')

        while True:
            choice = input(f'\n{Enter} Enter choice option: {Y}')
            if choice == '1':
                os.system('BootOptimization.bat')
                break

            elif choice == '2':
                os.system('CleanDisk.bat')
                break

            elif choice == '3':
                os.system('CleanMemoryRAM.bat')

                break

            elif choice == '4':
                os.system('CloseBackGround.bat')
                break

            elif choice == '5':
                os.system('SuperCPU.bat')
                break

            elif choice == '6':
                SelCPU.main()
                break

            elif choice == '7':
                SelGPU.main()
                break

            elif choice == '8':
                Run.main()
                break

            elif choice == '9':
                BIOS.BIOS_Loading()
                break

            elif choice == '10':
                 FixBug.FixBugSys()
                 break

            else:
                sys.exit(0)

    except KeyboardInterrupt:
        pass
if __name__ == '__main__':
    WinSys()
