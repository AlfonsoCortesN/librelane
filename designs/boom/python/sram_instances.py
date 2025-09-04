
import json

def find_sram(hierarchy, instance):
    hierarchy = hierarchy + "." + instance['instance_name']
    if instance['instances'] == []:
        if hierarchy[-3:] == "ext":
            print(hierarchy)
        return
    else:
        for i in instance['instances']:
            find_sram(hierarchy, i)
        return

with open('model_module_hierarchy.json', 'r') as file:
    data = json.load(file)

top = data['instances'][0]
print(top['instance_name'])
find_sram("", top)
