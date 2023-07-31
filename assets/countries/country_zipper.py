import json
import os

# This Python File would help with auto configuring country information
# incase countries are added or removed

# NOTE: This file uses relative paths (which have not been tested)

# NOTE: This package uses country_code information from flagPath to generate
# the files, if country flags have similar initials, it would break.

# NOTE: This would append the list of countries NOT overwrite

with open('codes.json', 'r') as fcc_file:
    country_data = json.load(fcc_file)
    #print(json.dumps(country_data, indent=4, sort_keys=True))

# folder path
dir_path = r'flags'

# list to store files if needed
files = []

# Iterate directory
for path in sorted(os.listdir(dir_path)):
    # check if current path is a file
    if os.path.isfile(os.path.join(dir_path, path)):
        for value in country_data:
            # verify the country code with first 2 letters of path
            if (value['code'].lower() == path[0:2]):
                print (f"""static Country ps{value['code']} = Country(\n
                            name: {value['name']},\n 
                            code: {value['code']},\n
                            dialCode: {value['dial_code']},\n 
                            flagPath: assets/countries/flags/{path}\n
                        );""")
                        
                f = open("../lib/app_utils/countries/countries.dart", "a")
                f.write("static Country ps" + value['code'] +  "= Country(\n")
                f.write("\tname: " + repr(value['name']) +  ",\n")
                f.write("\tcode: " + repr(value['code']) +  ",\n")
                f.write("\tdialCode: " + repr(value['dial_code']) +  ",\n")
                f.write("\tflagPath: 'assets/countries/flags/" + path + "'" + "\n")
                f.write(");")
                f.close()
            

