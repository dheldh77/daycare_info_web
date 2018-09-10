class ChildrenController < ApplicationController
  before_action :authenticate_user!

  # C 만들기 ----------------------------------------
  def new
    # 선생님이 아니면 만들 수 없게
    if current_user.usertype != "teacher"
      redirect_to "/children/index"
    end
  end

  def create
    uploader = ImageUploader.new
    uploader.store!(params[:image])

    @child = Child.new
    @child.name =params[:input_name]
    @child.age = params[:input_age].to_i
    @child.gender = params[:input_gender].to_i
    @child.kindergarden_id = params[:input_kindergarden_id].to_i
    @child.className = params[:input_className]
    @child.classNumber = params[:input_classNumber].to_i
    @child.user_id = current_user.id
   
    # allday 등록
    if params[:input_allday] == "1"
      @child.allday = true
    else
      @child.allday = false 
    end

    @child.thumbnail = uploader.url

    @child.save

    redirect_to "/children/show/#{@child.id}"
  end

  # R 보여주기 ----------------------------------------
  def index
    @children =Child.all
  end

  def show
    @child = Child.find(params[:id])
  end

  # U 수정하기 ----------------------------------------
  def edit
    # 선생님이 아니면 만들 수 없게
    if current_user.usertype != "teacher"
      redirect_to :back
    end

    @child = Child.find(params[:id])
  end

  def update
    @child = Child.find(params[:id])
    
    @child.name =params[:input_name]
    @child.age = params[:input_age].to_i
    @child.gender = params[:input_gender].to_i
    @child.kindergarden_id = params[:input_kindergarden_id].to_i
    @child.className = params[:input_className]
    @child.classNumber = params[:input_classNumber].to_i
   
    if params[:input_allday] == "1"
      @child.allday = true
    else
      @child.allday = false 
    end

    @child.save

    redirect_to "/children/show/#{@child.id}"
  end

  # D 삭제하기 ----------------------------------------
  def destroy
    @child = Child.find(params[:id])
    @child.destroy

    redirect_to "/children/index"
  end
end
