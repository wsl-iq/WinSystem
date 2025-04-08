import subprocess
import os

def cpu_name():
    try:
        result = subprocess.check_output("wmic cpu get name", shell=True)
        cpu_name = result.decode().split('\n')[1].strip()
        return cpu_name
    except Exception as e:
        return f"Error occurred: {e}"

def cpu_brand():
    cpu_name = cpu_name()
    if "Intel" in cpu_name:
        return "Intel"
    elif "AMD" in cpu_name:
        return "AMD"
    else:
        return "Other"

def run_batch_file(brand):
    if brand == "Intel":
        batch_file = "Intel.bat"
    elif brand == "AMD":
        batch_file = "AMD.bat"
    else:
        batch_file = None

    if batch_file and os.path.exists(batch_file):
        print(f"Running: {batch_file}")
        os.system(f'start "" "{batch_file}"')
    else:
        print("No matching batch file found or file is missing.")

def main():
    brand = cpu_brand()
    print(f"Detected CPU: {brand}")
    run_batch_file(brand)

if __name__ == "__main__":
    main()
