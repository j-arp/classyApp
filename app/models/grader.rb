require 'csv'

class Grader

  def src=(file)
  	@file = file
  	@content = File.read(file) 
  end

  def file
  	@file
  end

  def content
  	@content
  end

  def array 
  	students = []
  	csv_data = CSV.parse(@content, :headers => true)

  	csv_data.each do | t | 
    total_cols = t.count
 		students << {:netid => t["Student Id"], :grade => t["Calculated Grade"] }
 	end

 	return students
  end


end
