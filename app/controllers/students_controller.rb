class StudentsController < ApplicationController
  # GET /students
  # GET /students.json

  before_filter :get_classifications_and_majors

  def index
    @students = Student.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end
  
  def list
    @students = Student.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  def chart
    @students = Student.all
    @seats = Seat.all

    @rows = @seats.group_by{|s| s.row}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end
  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end
  def svn
  
    @student = Student.find(params[:id])
    exec "open /Users/jarp/MGTI-FA13/students/#{@student.netid}"
    if Dir.exists? "/Users/jarp/MGTI-FA13/students/#{@student.netid}"
      files = Dir.open("/Users/jarp/MGTI-FA13/students/#{@student.netid}")
    else
      Dir.mkdir "/Users/jarp/MGTI-FA13/students/#{@student.netid}"
      files = Dir.open("/Users/jarp/MGTI-FA13/students/#{@student.netid}")
    end
    render json: files
    #exec "open /Users/jarp/MGTI-FA13/students/#{@student.netid}"
  end
  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
      @ratings = Array(10.downto 1)
    end
  end

  # GET /students/1/edit
  def edit
   
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json


  def update
    @student = Student.find(params[:id])
    
    image_file = params[:student][:image_file]
    
    unless image_file.blank?
      @student.image = @student.upload_image(image_file)
    end

    params[:student].delete :image_file
    
    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end


  def get_classifications_and_majors
    @classifications = Classification.all
    @majors = Major.all
     @ratings = Array(10.downto 1)
  end
end
