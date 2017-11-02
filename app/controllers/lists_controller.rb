class ListsController < ApplicationController

  before_action :set_list, :only => [:show, :edit, :update, :destroy]

  def index 
    @lists = List.all
  end

  def new 
    @list = List.new
  end

  def update
    if @list.update_attributes(list_params)
      redirect_to list_path(@list), notice: "新增成功"
    else
      render :edit
    end
  end

  def destroy
    if @list.date > Date.today
      @list.destroy

      redirect_to lists_url
    else
      redirect_to lists_url, :notice => "超過時間，無法刪除"
    end
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_url
    else
      render :new
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :date, :note)
  end


end
