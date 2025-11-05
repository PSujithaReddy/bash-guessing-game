# This is the default rule that runs when you just type 'make'
all: README.md

README.md: guessinggame.sh
	# Create or overwrite the README.md file with the title
	echo "# Project: The Guessing Game" > README.md

	# Add a blank line
	echo "" >> README.md

	# Add the date and time 'make' was run
	echo "This README.md was generated on: **$(shell date)**" >> README.md

	# Add another blank line
	echo "" >> README.md

	# Get the line count of guessinggame.sh and add it
	echo "Lines of code in guessinggame.sh: **$(shell wc -l < guessinggame.sh)**" >> README.md

clean:
	rm -f README.md

