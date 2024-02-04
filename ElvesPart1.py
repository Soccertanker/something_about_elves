import argparse
import re

parser = argparse.ArgumentParser(prog="ElvesPart1",
        description="Calculate calibration values of Elves")
parser.add_argument('in_file')

args = parser.parse_args()
file_str = args.in_file

with open(file_str, mode="r", encoding="utf-8") as file_handle:
        lines = file_handle.readlines()

first_and_last_re = re.compile('\d')
sum = 0
for line in lines:
    line_digits = first_and_last_re.findall(line)
    if len(line_digits) == 1:
        # There is only one numeric digit in the line
        combined_number = int(line_digits[0] + line_digits[0])
    else:
        combined_number = int(line_digits[0] + line_digits[-1])
    sum += (combined_number)

print(f'The calibration values sum to {sum}')
