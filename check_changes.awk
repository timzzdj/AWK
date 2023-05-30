# Please note: file 1 is the old file and file 2 is the new file with expected changes.
# Shell command line input: gawk -f check_changes.awk
BEGIN {
	# Set input/output field separators to tabs
	FS = OFS = "\t"
	# Get user input for file names
	printf("Enter file1 name: ")
	getline ucfile1 < "-"
	printf("Enter file2 name: ")
	getline ucfile2 < "-"

	# Loop processing a file to compare from
	while((getline line < ucfile1) > 0)
	{
		# Loop processing each field into an array
		for(f1_index = 1; f1_index <= NF; f1_index++)
		{
			file1[$f1_index] = 1
		}
	}
	close(ucfile1)
}
# Loop body
{
	# Loop processing a file to compare with
	for(f2_index = 1; f2_index <= NF; f2_index++)
	{
		file2[$f2_index] = 1
	}

	# Compare changes made and print changes
	for(field in file2)
	{
		# Checks if field in file2 is also in file1
		if(!(field in file1))
		{
			printf("New field detected in row $d: %s\n", NR, field)
		}
		else
		{
			# Checks if changes are made in each fields of both files
			if(file1[field] != file2[field])
			{
				printf("Changes made in row %d: %s\n", NR, field)
				printf("Old value: %s\n", file1[field])
				printf("New value: %s\n", file2[field])
				print "--------"
			}
		}
	}

	# Loop processing changes made and print changes
	for(field in file1)
	{
		# Checks if field in file1 is also in file2
		if(!(field in file2))
		{
			printf("Removed field detected in row %d: %s\n", NR, field)
		}
	}

}