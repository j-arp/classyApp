class Student < ActiveRecord::Base
  belongs_to :section
  belongs_to :classification
  attr_accessible :classification_id, :first, :image, :last, :netid, :section_id

  def full_name
  	"#{first} #{last}"
 	end 

  def image_url
    unless image.blank?
  	 "/assets/students/#{image}"
    else
       "/assets/students/placeholder.jpg"
    end

  end

  def upload_image(image_file)
  	directory = 'app/assets/images/students'
    full_directory = Rails.root.join(directory)

  	File.open(Rails.root.join(directory, image_file.original_filename), 'wb') do |file|
        file.write(image_file.read)
     end

     new_file_name = "#{netid}#{File.extname(image_file.original_filename)}"

     File.rename(
        Rails.root.join(directory, image_file.original_filename), 
        Rails.root.join(directory, new_file_name)
        )

     return new_file_name

  end
  
end
