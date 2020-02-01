require 'csv'

puts "Student Assignment Average"

CSV.foreach("input.csv", col_sep: ',', row_sep: :auto, headers: true) do |row|
  #Establishing our local variables for this loop
  total_grade = 0
  name = ""
  #Loop through rows with a range of 1..4 specifying how many columns starting at 1 and ending in 4 for grades
  (1 .. 4).each do |column_index|
    #Add a check for nil rows, if row is nil then skip this iteration
    if row[column_index] == nil
      next
    end
    #Grade equals current row index and converting it to integer
    grade = row[column_index].strip.to_i
    total_grade += grade
    #Name is set from row[0] the first column in the row
    name = row[0]
  end
  #Avg = total_grade/4.0 converting it to a float at the same time
  avg = total_grade/4.0
  #Put name and average to output with a tab separating the columns
  puts "#{name}\t#{avg}"
  #End of loop, now it repeats for the remainder of the rows until done
end