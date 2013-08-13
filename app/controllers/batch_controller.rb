class BatchController < ApplicationController
  def index
  	@sections = Section.all
  end

  def svn
    puts "Reading config"
    puts Rails.application.config.local_svn_path
    render :json => params
  end

  def import

  	import_file = params[:file]
	   
    if true
      #params.has_key? :clear
      #puts "clear out all for #{params[:section_id]}"
      Student.delete_all
      #(["section_id = ?", params[:section_id]])
    end

    unless import_file.original_filename.nil?
  	   File.open(Rails.root.join('data_store/imports', import_file.original_filename), 'wb') do |file|
          file.write(import_file.read)
       end
    end

     importer = Importer.new
     importer.src = Rails.root.join('data_store/imports', import_file.original_filename)
     @students = importer.array

     #puts importer.content
     #puts importer.array

     populate(@students, params[:section_id])

  	#render :json => @students
  end


  def populate(students, section_id)
  	students.each do | student |
      

  		s = Student.new
  		s.first = student[:first]
  		s.last = student[:last]
      s.nickname = ""
      s.image = "#{student[:netid]}.jpeg"
  		s.netid = student[:netid]
  		s.classification_id = Classification.first.id
  		s.section_id = section_id
      s.major_id = Major.first.id
  		s.save
  	end

  end

  def clear
  end
  
end
