require 'csv'
system 'clear'

students = []

file_content = File.read('students.csv') 
csv_data = CSV.parse(file_content, :headers => true)
#puts content
#puts test_file
puts csv_data.by_col

csv_data.each do | t | 
 	students << {:netid => t[0], :first => t[4] , :last => t[5], :classification=> t[3]}
 end

 puts students[0][:netid]