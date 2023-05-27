# Command line script: gawk -f fill_empty_field.awk < sample_dataset.txt > output_dataset.txt

# Executes at the start before the body of the loop
BEGIN {
	# Sets the delimiter as tabs
	FS = OFS = "\t"
}

# Loop body
{
	# Loops processing every field in a data set
	for (cell_index = 1; cell_index <= NF; cell_index++)
	{
		# Checks if field is empty then fills it with 'NULL' when true
		if($cell_index == "" || $cell_index ~ /^[[:space:]]*$/)
		{
			$cell_index = "NULL"
		}
	}
	print $0
}