class MyDaysController < ApplicationController

  load_and_authorize_resource
  before_action :my_days_list, only: [:index]
  before_action :set_my_day, only: [:show, :update, :destroy]

  def index
    render_content(@my_days)
  end

  def show
    render_content(@my_day)
    @photos = @my_day.photos
  end


  def update
    render_content(@my_day.update_attributes(my_day_params) ? {my_day: @my_day, status: true} : {errors: @my_day.errors, status: false})
    @my_day.photos.create(parse_photos)
  end

  def destroy
    render_content({status: (@my_day && @my_day.destroy ? true : false)})
  end

  private

    def my_day_params
      params.require(:my_day).permit(:description, :day)
    end

    def my_days_list
      if @current_user.type?('Teacher')
        @my_days = @current_user.group.my_days.where(day: server_day)
      end
    end

    def set_my_day
      @my_day = MyDay.find(params[:id])
    end

    def parse_photos
      params[:photos].map do |img|
       { image: decode_base64_image(img) }
      end
    end

end
