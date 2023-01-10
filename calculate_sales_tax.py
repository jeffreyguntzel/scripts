import sys
import pyperclip

# Get pre-tax dollar amount from command line argument
amount = float(sys.argv[1])

# Calculate total based on 8.025% sales tax
total = round(amount + (amount * .0825),2)

# Place total on clipboard
pyperclip.copy(total)

# Let user know what was copied to the clipboard
print(f"Total copied to clipboard: {total}")