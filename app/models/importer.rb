require 'csv'

class Importer 

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

    c = Classification.find_or_create_by_name(t[3])
      
 		students << {:netid => t[0], :first => t[4] , :last => t[5], :classification_id=> c.id}
 	end

 	return students
  end


end
