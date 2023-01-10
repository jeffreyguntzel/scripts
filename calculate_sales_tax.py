import sys
import pyperclip

# Get amount from command line argument
amount = float(sys.argv[1])

# Calculate total
total = round(amount + (amount * .07525),2)

# Place total on clipboard
pyperclip.copy(total)

print(f"Total copied to clipboard: {total}")