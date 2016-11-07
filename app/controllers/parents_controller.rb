class ParentsController < ApplicationController
  def show
    @parent = Parent.find(params[:id])
    if @parent.nil?
      render 'index'
    else
      render json: @parent
    end
  end

  def new
    @parent = Parent.new
    render json: @parent
  end

   def index
    @parent = Parent.all
    render json: @parent
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      redirect_to @parent
    else
      render 'new'
    end
  end

  def edit
    @parent= Parent.find(params[:id])
    render json: @parent
  end

  def destroy
    Parent.find(params[:id]).destroy
    render json: @parent
  end

  def update
    @parent = Parent.find(params[:id])
    if @parent.update_attributes(parent_params)
     render json: @parent

    # Handle a successful update.
    else
      render 'edit'
    end
  end

  private

  def parent_params
    params.
      require(:parent).
<<<<<<< HEAD
      permit(:first_name, :last_name, :email, :contact_phone,
             :password, :password_confirmation)
=======
      permit(:first_name, :last_name, :student_id, :email, :contact_phone,
             :password, :password_confirmation, :school_id)
>>>>>>> aaa75f16c10bea2e0b4453349fc34840eb9a2e6b
  end
end
