class SeatsController < ApplicationController
  # GET /seats
  # GET /seats.json


  def assign
    puts 'assign student!'
    current_seats = Seat.find_all_by_student_id(params[:student_id])
    @response = {current_seats: current_seats}
    
    current_seats.each do | s |
      s.student_id = nil
      s.save
    end

    @seat = Seat.find(params[:id])
    @seat.student_id = params[:student_id]
    @seat.save
    
    puts @seat

    render json: @response

  end

  def clear
    classroom = Classroom.last
    @seats = Seat.find_all_by_classroom_id(classroom.id)

    @seats.each do | seat | 
      seat.student_id = nil
      seat.save
    end

    render json: @seats

  end
  def generate
    classroom = Classroom.last
    Seat.delete_all(:classroom_id => classroom.id)
    rowArray = Array(1..4)
    
    rowArray.each do | r | 
      posArray = Array(1..8)

      posArray.each do | p | 
        Seat.create!(:row=>r, :position=>p, :classroom_id => classroom.id)
      end

    end

    render json: true

  end

  def index
    @seats = Seat.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seats }
    end
  end

  # GET /seats/1
  # GET /seats/1.json
  def show
    @seat = Seat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @seat }
    end
  end

  # GET /seats/new
  # GET /seats/new.json
  def new
    @seat = Seat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @seat }
    end
  end

  # GET /seats/1/edit
  def edit
    @seat = Seat.find(params[:id])
  end

  # POST /seats
  # POST /seats.json
  def create
    @seat = Seat.new(params[:seat])

    respond_to do |format|
      if @seat.save
        format.html { redirect_to @seat, notice: 'Seat was successfully created.' }
        format.json { render json: @seat, status: :created, location: @seat }
      else
        format.html { render action: "new" }
        format.json { render json: @seat.errors, status: :unprocessable_entity }
      end
    end
  end


  def unassign
    @seat = Seat.find(params[:id])

    @seat.student_id = nil
    @seat.save

    render json: @seat

  end



  # PUT /seats/1
  # PUT /seats/1.json
  def update
    @seat = Seat.find(params[:id])

    respond_to do |format|
      if @seat.update_attributes(params[:seat])
        format.html { redirect_to @seat, notice: 'Seat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @seat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seats/1
  # DELETE /seats/1.json
  def destroy
    @seat = Seat.find(params[:id])
    @seat.destroy

    respond_to do |format|
      format.html { redirect_to seats_url }
      format.json { head :no_content }
    end
  end
end
