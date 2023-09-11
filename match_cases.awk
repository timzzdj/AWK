# Define a function to check if two rows are identical (case-insensitive)
function is_duplicate(row1, row2) {
  n = split(row1, arr1, ",")
  n2 = split(row2, arr2, ",")
  if (n != n2) return 0
  for (i = 1; i <= n; i++) {
    if (tolower(arr1[i]) != tolower(arr2[i])) return 0
  }
  return 1
}

# Initialize an array to keep track of seen rows
BEGIN { FS = "," }

# Process each row
{
  # Convert the row to a string
  row_string = $0

  # If it's a duplicate (case-insensitive), print it to the command line
  for (key in seen_rows) {
    if (is_duplicate(key, row_string)) {
      print "Duplicate Row:", $0
      next
    }
  }

  # Otherwise, mark it as seen
  seen_rows[row_string] = 1
}
