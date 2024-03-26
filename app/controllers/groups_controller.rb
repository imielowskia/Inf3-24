class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy details attnds addattnds saveattnds clearattnds cleardetails]

  # GET /groups or /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1 or /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end


  def details

  end


  # metoda do budowania list obecności
  def attnds
    @course = Course.find(params[:course_id])
    @students = @group.students
    attndlist(@students)
  end


  # metoda do nowej listy obecności
  def addattnds
    @course = Course.find(params[:course_id])
    @students = @group.students
  end

  def saveattnds
    @course = Course.find(params[:course_id])
    @students = @group.students
    ids = params[:present]
    data = params[:data]
    for i in 0..ids.count()-1
      student = Student.find(ids[i].to_i)
      xattnd = Attendant.new
      xattnd.student_id = student.id
      xattnd.course_id = @course.id
      xattnd.data = data
      xattnd.save
    end
    attndlist(@students)
    respond_to do |format|
      format.turbo_stream
    end
  end

  def clearattnds
    @course = Course.find(params[:course_id])
  end

  def cleardetails

  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to group_url(@group), notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy!

    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def attndlist(students)
      @dates = []
      students.each do |s|
        s.attendants.where(course_id: @course.id).each do |a|
          if !@dates.include?(a.data)
            @dates<<a.data
          end
        end
      end
      @attnds = []
      students.each do |s|
        lista = []
        s.attendants.where(course_id: @course.id).each do |a|
          lista<<a.data
        end
        @attnds[s.id]=lista
      end
    end

    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name, :shortname, :field_id, course_ids: [])
    end
end
