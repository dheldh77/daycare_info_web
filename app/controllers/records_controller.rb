class RecordsController < ApplicationController
  before_action :authenticate_user!
  # C 만들기 ----------------------------------------
  def new
    @child = Child.find(params[:id])
  end

  def create
    @record = Record.new
    @record.child_id = params[:child_id].to_i
    @record.recordDate = params[:input_date].to_date
    @record.participation = 6 - params[:input_participation].to_i
    @record.meal = 6 - params[:input_meal].to_i
    @record.activity = 6 - params[:input_activity].to_i
    @record.comment = params[:input_comment]
    @record.save

    redirect_to "/records/show/#{@record.id}"
  end
  
  # R 보여주기 ----------------------------------------
  def index
    @child = Child.find(params[:id])
    # @records = Record.all
    @records = Record.where("child_id like ?", "#{@child.id}").reverse
    # 후에 해당 child 것만
  end

  def show
    @record = Record.find(params[:id])
    @child = Child.find(@record.child_id)
  end

  # U 수정하기 ----------------------------------------
  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    # 아기 아이디 @record.child_id = params[:child_id].to_i
    @record.recordDate = params[:input_date].to_date
    @record.participation = 6 - params[:input_participation].to_i
    @record.meal =  6 - params[:input_meal].to_i
    @record.activity = 6 - params[:input_activity].to_i
    @record.comment = params[:input_comment]
    @record.save

    redirect_to "/records/show/#{params[:id]}"
  end

  # D 삭제하기 ----------------------------------------
  def destroy
    @record = Record.find(params[:id])
    @record.destroy

    redirect_to "/records/index"
  end
end
