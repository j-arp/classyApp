class Student < ActiveRecord::Base
  extend FriendlyId
  friendly_id :netid
  belongs_to :section
  belongs_to :classification
  belongs_to :major
  has_one :seat
  has_many :members
  has_many :teams, :through => :members
  has_many :notes

  attr_accessible :classification_id, :first, :image, :last, :netid, :section_id, :major_id, :repo, :nickname, :is_active, :rating

  scope :assigned, :joins => (:members) 
  default_scope {where(:is_active => true)}
  
#scope :with_cd_player, joins(:cars).where('cars.radio_id is not null')
  
  def to_s
    full_name
  end

  def self.unassigned 
    assigned_ids = Student.assigned.pluck(:id)
    unassigned = Student.find(:all, :conditions => ['id not in (?)', assigned_ids])
    #Topic.find(:all, :conditions => ['forum_id not in (?)', @forums.map(&:id)])
  end

  def destroy
    self.is_active = false;
    self.save
  end

  def full_name
    if nickname.empty? 
    	"#{first} #{last}"
    else
      "#{nickname} #{last}"
   	end 

 end

  def image_url
    unless image.blank?
  	 "/assets/students/#{image}"
    else
       "/assets/students/placeholder.jpg"
    end
  end


  def repo_url
    "https://itmlab-web.business.nd.edu/svn/#{section.course.code}-#{section.course.number}-#{section.semester.name}#{section.year}/students/#{netid}"
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
  

  def generate_password
    SecureRandom.hex(3)
  end

end
