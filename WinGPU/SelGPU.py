import subprocess
import os

def gpu_name():
    try:
        result = subprocess.check_output("wmic path win32_VideoController get name", shell=True)
        lines = result.decode().split('\n')
        gpu_lines = [line.strip() for line in lines if line.strip() and "Name" not in line]
        if gpu_lines:
            return gpu_lines[0]  # First GPU
        return "Unknown GPU"
    except Exception as e:
        return f"Error occurred: {e}"

def gpu_brand():
    gpu_name = gpu_name()
    if "Intel" in gpu_name:
        return "Intel"
    elif "AMD" in gpu_name:
        return "AMD"
    elif "NVIDIA" in gpu_name.upper():
        return "NVIDIA"
    else:
        return "Other"

def run_batch_file(brand):
    batch_file = f"{brand}.bat"
    if os.path.exists(batch_file):
        print(f"Running: {batch_file}")
        os.system(f'start "" "{batch_file}"')
    else:
        print(f"Batch file not found: {batch_file}")

def main():
    gpu_brand = gpu_brand()
    print(f"Detected GPU: {gpu_brand}")
    run_batch_file(gpu_brand)

if __name__ == "__main__":
    main()
