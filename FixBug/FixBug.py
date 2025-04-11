import os

def FixBugSys():
    try:
        os.system('cls' if os.name == 'nt' else 'clear')
        os.system('Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned')
        os.system('.\FixBug.ps1')
    except KeyboardInterrupt:
        pass
if __name__ == '__main__':
    FixBugSys()