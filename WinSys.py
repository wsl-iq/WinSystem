import os, sys
from WinCPU import Info_CPU
from WinGPU import Info_GPU
from UnlockSpeed import Run

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
        print(f'{G}[1] {B}Boot Optimization{W}\n{G}[2] {B}Clean Hard Disk{W}\n{G}[3] {B}Clean or Clear Memory Ram{W}\n{G}[4] {B}Close App Background{W}')
        print(f'{G}[5] {B}Super CPU{W}\n{G}[6] {B}Processor optimization CPU{W}\n{G}[7] {B}Optimize Graphics GPU{W}\n{G}[8] {B}Overclocking{W}')

        while True:
            choice = input(f'\n{Enter} Enter choice option: {Y}')
            if choice == '1':
                os.system('BootOptimization.bat')
                break

            elif choice == '2':
                os.system('CleanDisk.bat')
                break

            elif choice == '3':
                os.system('clearRam.bat')
                os.system('ClearRam.bat')
                break

            elif choice == '4':
                os.system('CloseBackGround.bat')
                break

            elif choice == '5':
                os.system('SuperCPU.bat')
                break

            elif choice == '6':
                Info_CPU.main()
                break

            elif choice == '7':
                Info_GPU.main()
                break

            elif choice == '8':
                Run.main()
                break

            else:
                sys.exit(0)

    except KeyboardInterrupt:
        pass
if __name__ == '__main__':
    WinSys()