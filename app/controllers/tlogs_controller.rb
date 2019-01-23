class TlogsController < ApplicationController
  before_action :set_tlog, only: [:destroy, :edit, :update]
  
  def index
    @tlog = Tlog.all
  end
  
  def new
    if params[:back]
      @tlog = Tlog.new(tlog_params)
    else
      @tlog = Tlog.new
    end
  end
  
  def create
    @tlog = Tlog.new(tlog_params)
    if @tlog.save
      redirect_to tlogs_path
    else
      render 'new'
    end
  end
  
  def confirm
    @tlog = Tlog.new(tlog_params)
    render :new if @tlog.invalid?
  end
  
  def edit
  end
  
  def update
    if @tlog.update(tlog_params)
      redirect_to tlogs_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @tlog.destroy
    redirect_to tlogs_path    
  end
  
  private
  
  def tlog_params
    params.require(:tlog).permit(:content)
  end
  
  def set_tlog
    @tlog = Tlog.find(params[:id])
  end
end
