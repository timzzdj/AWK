# shell command: gawk -f dimension_matrix.awk < output_dataset.txt
# Initial code execution
BEGIN {
	FS = OFS = "\t"	# Sets delimiter as tabs
	rows = 0		# Dataset Rows
	columns = 0		# Dataset columns
}
# Loop Body
{
	# Increments rows at every new line '\n'
	rows++
	# Checks for the first row and sets the total columns
	if(rows == 1)
	{
		columns = NF
	}
}
# Output
END {
	print "Rows", rows
	print "Columns", columns
}