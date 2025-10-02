
import json

path = "/home/alfonso/librelane/designs/rocket/src/chipyard.harness.TestHarness.TinyRocketConfig.top.mems.v"

def find_instances(sram_dict):
    with open(path, 'r') as file:
        all_macro_instances = {}
        module_macros = {}
        for line in file:
            text = line.split()
            if(len(text)>0):
                if (text[0] == 'module'):
                    key = text[1][0:-1]
                    module_macros = {}
                if(text[0][0:10] == 'RM_IHPSG13'):
                    if(module_macros.get(text[0]) == None):
                        module_macros[text[0]] = [text[1]]
                    else:
                        module_macros[text[0]].append(text[1])
                if(text[0] == 'endmodule'):
                    for macro in module_macros.keys():
                        if(all_macro_instances.get(macro) == None):
                            all_macro_instances[macro] = []
                        for module_instance in sram_dict[key]:
                            for i in module_macros[macro]:
                                all_macro_instances[macro].append(module_instance[1:] + '.' + i)
                        # sram_instance = module_instance[1:] + '.' + text[1]
                        # all_macro_instances[text[0]].append(sram_instance)
        return all_macro_instances
                
def find_sram(hierarchy, instance, sram_dict):
    hierarchy = hierarchy + "." + instance['instance_name']
    if instance['instances'] == []:
        module_name = instance['module_name']
        if module_name[-3:] == "ext":
            if (sram_dict.get(module_name) == None):
                sram_dict[module_name] = [hierarchy]
            else:
                sram_dict[module_name].append(hierarchy)
        return sram_dict
    else:
        for i in instance['instances']:
            sram_dict = find_sram(hierarchy, i, sram_dict)
        return sram_dict


with open('model_module_hierarchy.json', 'r') as file:
    data = json.load(file)

top = data['instances'][0]['instances'][0]
sram_dict = find_sram("", top, {})
macro_instances = find_instances(sram_dict)

count = 0
with open('macro_instances.txt', 'w') as file:
    for key in macro_instances:
        file.write("  " + key + ":\n")
        file.write("    instances:\n")
        for i in macro_instances[key]:
            file.write ("      " + i + ":\n")
            file.write ("        location: [0.0, 0.0]\n")
            file.write ("        orientation: N\n")
            count += 1
print("macro instances: ", count)

with open('macro_connections.txt', 'w') as file:
    file.write("\n")
    file.write("PDN_MACRO_CONNECTIONS:\n")
    for key in macro_instances:
        for i in macro_instances[key]:
            file.write ("  - \"" + i + " VDD VSS VDD! VSS!\"\n")
            file.write ("  - \"" + i + " VDD VSS VDDARRAY! VSS!\"\n")
    file.write("\n")