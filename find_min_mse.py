with open('result_long_term_forecast.txt', 'r') as file:
    lines = file.readlines()



results = []
i = 0
while i < len(lines) - 1:
    if "beigang" in lines[i].lower():
        mse_line = lines[i + 1]
        if "mse:" in mse_line:
            parts = mse_line.split(',')
            mse = float(parts[0].split('mse:')[1].strip())
            if mse<10:
                results.append(f"num {i}: {mse}, {lines[i].strip()} + '\n' + {mse_line.strip()}")
    i += 1

# Sort by MSE and extract the top entries
results.sort()
top_lines = [line for  line in results[:10]]

for line in top_lines:
    print(line)

