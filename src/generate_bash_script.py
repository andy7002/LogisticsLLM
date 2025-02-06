import os
from common import *


def generate_train_bash_script(directory, auto_shutdown=False):
    script_lines = [
        "#!/bin/bash\n\n"
    ]

    # Set the CUDA device
    cuda_line = "CUDA_VISIBLE_DEVICES=0"

    # Get all .yaml files
    config_files = [f for f in os.listdir(directory) if f.endswith('.yaml')]

    # Initialize task number
    task_total_number = len(config_files)
    task_number = 1  # Starting from 1

    for config_file in config_files:
        script_lines.append(
            f"echo \"$(date '+%Y-%m-%d %H:%M:%S') Start training task {task_number}/{task_total_number}.\""
            f" | tee -a logs/process.log >> logs/output.log")
        script_lines.append(f"echo \"llamafactory-cli train config/{config_file}\" | tee -a logs/process.log >> "
                            f"logs/output.log")
        script_lines.append(f"{cuda_line} llamafactory-cli train config/{config_file} > logs/output.log 2>&1 &")
        script_lines.append("pid=$!")
        script_lines.append("")
        script_lines.append(f"# Wait for task {task_number} to complete")
        script_lines.append("wait $pid")
        script_lines.append("if [ $? -ne 0 ]; then")
        script_lines.append(f"     echo \"The {task_number} task failed.\" >> logs/process.log")
        script_lines.append("fi")
        script_lines.append("")
        task_number += 1

    if auto_shutdown:
        script_lines.append("# Auto shutdown")
        script_lines.append("INTERVAL=60")
        script_lines.append("THRESHOLD=1024")
        script_lines.append("while true; do")
        script_lines.append("    # Get the current memory usage of the GPU (in MiB)")
        script_lines.append("    MEMORY_USED=$(nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits)")
        script_lines.append("    # Check if the memory usage is below the threshold")
        script_lines.append("    if [ \"$MEMORY_USED\" -lt \"$THRESHOLD\" ]; then")
        script_lines.append(f"        echo \"$(date '+%Y-%m-%d %H:%M:%S') Memory usage is below 1GB, preparing to "
                            f"shut down.\"| tee -a logs/process.log >> logs/output.log")
        script_lines.append("        sleep 10")
        script_lines.append("        shutdown -h now")
        script_lines.append("        break")
        script_lines.append("    fi")
        script_lines.append("    # Wait for the specified interval time(seconds)")
        script_lines.append("    sleep $INTERVAL")
        script_lines.append("done\n")

    # Join all lines to form the final script
    bash_script = "\n".join(script_lines)

    # Write to a bash script file
    with open("../scripts/train.sh", "w", encoding='utf-8', newline='\n') as f:
        f.write(bash_script)


def generate_predict_bash_script(directory):
    # Traverse the directory and collect all .yaml filenames
    filenames = [f for f in os.listdir(directory) if f.endswith('.yaml')]

    # Function to generate shell script content based on filenames
    script_content = "#!/bin/bash\n\n"
    task_counter = 1
    task_total_number = len(filenames)

    # cross loss fun
    for filename in filenames:
        parts = filename.split('_')
        dataset = parts[0]

        scale_details = parts[1]
        scale = scale_details.split('Scale')[1]

        split_details = parts[2]
        split = split_details.split('Split')[1]
        order = parts[3]
        sequence = parts[4]
        cot_details = parts[5]
        cot = cot_details.split('Cot')[1]
        model = parts[6]
        epoch_details = parts[7]
        epoch = epoch_details.split('Epochs')[1]

        # Construct the nohup command
        script_content += (
            f"echo \"$(date '+%Y-%m-%d %H:%M:%S') The {task_counter}/{task_total_number} task starting: {filename}"
            f".\" | tee -a logs/process.log >> logs/output.log\n")
        script_content += (
            f"echo \"llm_logistics.py --dataset={dataset} --model_name={model} --epoch={epoch} --loss_fun=cross --mode=test"
            f" --split={split} --order_strategy={order} --sequence={sequence} --cot={cot} --scale={scale}\"\n")
        script_content += (
            f"nohup python llm_logistics.py --dataset={dataset} --model_name={model} --epoch={epoch} --loss_fun=cross --mode=test"
            f" --split={split} --order_strategy={order} --sequence={sequence} --cot={cot} --scale={scale} > "
            f"logs/output.log 2>&1 &\npid=$!\n")
        script_content += "wait $pid\n"
        script_content += f"if [ $? -ne 0 ]; then\n    echo \"The {task_counter} task failed.\" >> logs/output.log\nfi\n\n"
        task_counter += 1

    script_content += "echo \"-----------------------\" >> result/metrics/metrics_$(date +%Y%m%d).csv"

    # Optional: Save the generated script to a file
    with open("../scripts/predict.sh", "w", encoding='utf-8', newline='\n') as f:
        f.write(script_content)


if __name__ == '__main__':
    # Call functions, assuming configuration files are located in "HyperParameter" directory
    generate_train_bash_script("../config", False)
    generate_predict_bash_script("../config")
