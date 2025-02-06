from jinja2 import Environment, FileSystemLoader
import yaml
from common import *

# Generate dataset names list through combinations
datasets = [
    f"{ds_type}_Scale{scale}_Split{split}_{order}_{input_seq}_Cot{cot_type}"
    for ds_type in datasets_types if "OneHot" not in ds_type
    for order in order_strategy_settings.get(ds_type, order_strategy_settings['default'])
    for input_seq in input_sequences
    for split in dataset_split_settings.get((ds_type, order, input_seq), dataset_split_settings['default'])
    for cot_type in cot_settings.get((split, order, input_seq), cot_settings['default'])
    for scale in dataset_scale_settings.get((ds_type, order, input_seq, split, cot_type), dataset_scale_settings['default'])
]

# Set up the Jinja2 template environment
file_loader = FileSystemLoader('../templates')  # Assumes templates are in 'templates' directory
env = Environment(loader=file_loader)

# Load the Jinja2 template
template = env.get_template('config_template.yml.j2')

index = 1

# Generate configurations and create YAML files for each combination
for model in models:
    for dataset in datasets:
        # Extract the dataset type from the dataset name
        ds_type = dataset.split('_')[0]

        scale_details = dataset.split('_')[1]
        scale = scale_details.split('Scale')[1]

        split_details = dataset.split('_')[2]
        split = split_details.split('Split')[1]

        cot_details = dataset.split('_')[5]
        cot = cot_details.split('Cot')[1]

        if split not in model_split_settings.get(model, model_split_settings['default']):
            continue

        # Determine the number of epochs based on the dataset type and model
        num_epochs = epoch_settings.get((ds_type, scale, split, cot, model), epoch_settings['default'])

        if -1 == num_epochs:
            continue

        fp_template = fine_tuning_templates.get(model)

        # Data to fill in the template
        data = {
            'model_name_or_path': model,
            'dataset': dataset,
            'num_train_epochs': num_epochs,
            'template': fp_template,
            'language': 'En'  # Modify based on dataset if needed
        }

        # Render the template with data
        output = template.render(data)
        file_name = f"../config/{dataset}_{model}_Epochs{num_epochs}_En.yaml"

        # Write the rendered output to a new YAML file
        with open(file_name, 'w') as f:
            yaml.safe_load(output)  # Validate YAML format for correctness
            f.write(output)
        print(f"{index}. YAML file {file_name} has been generated successfully.")
        index = index + 1