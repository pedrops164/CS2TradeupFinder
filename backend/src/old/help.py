def convert_booleans_in_sql(input_file, output_file):
    with open(input_file, 'r', encoding='utf-8') as file:
        sql_content = file.read()

    for i in range(0,77):
        # Replace 0 and 1 in the skins INSERT statement with false and true
        sql_content = sql_content.replace(f"0,{i},'", f"false,{i},'")
        sql_content = sql_content.replace(f"1,{i},'", f"true,{i},'")

    with open(output_file, 'w', encoding='utf-8') as file:
        file.write(sql_content)

# Example usage
convert_booleans_in_sql('skins_dump.sql', 'converted_skins_dump.sql')