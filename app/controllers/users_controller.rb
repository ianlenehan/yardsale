class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def edit
  end

  def update
    req = Cloudinary::Uploader.upload( params[:user][:photo] ) if params[:user][:photo]
    user = @currentUser
    user.photo = req["url"] if req
    user.update user_params
    user.current_latitude = user.latitude
    user.current_longitude = user.longitude
    user.save
    redirect_to user_path
  end

  def show
    @user = @currentUser
    @items = Item.where(:user_id => @user.id)
  end

  def locate
    user = @currentUser
    respond_to do |format|
      format.html {}
      format.json { render json: @response }
    end
    if params[:lat] != 'default'
      puts "locate me /n/n/n/n/n/n/n"
      user.current_latitude = params[:lat]
      user.current_longitude = params[:long]
      user.save
    else
      puts "default location /n/n/n/n/n/n/n"
      user.current_latitude = user.latitude
      user.current_longitude = user.longitude
      user.save
    end
  end

  def verify
    returned_key = params["authHeader"].to_s.split("=")[1][1, 25]
    returned_api_url = params["apiUrl"]
    my_key = 'e1SWhR3fwM8ftCJw0uQ93mY3J'
    options = {
      headers: {
        'Authorization' => params["authHeader"],
        'authorization' => params["authHeader"]
      }
    }
    if returned_key == my_key && (returned_api_url[0, 18] == "https://api.digits" || returned_api_url[0, 19] == "http://api.twitter")
      @verification = HTTParty.get("#{returned_api_url.to_s}", options)
    else
      @verification = false
    end
    if !(@verification.parsed_response.key?("errors")) && (@verification.response.kind_of? Net::HTTPOK)
      @phone = @verification.parsed_response["phone_number"]
      @response = { :success => true, :phone => @phone }
    else
      @response = { :success => false }
    end
    # puts params.inspect
    respond_to do |format|
      format.html {}
      format.json { render json: @response }
    end
    # redirect_to '/items/:phone'
  end

private
  def user_params
    params.require(:user).permit(:name_first, :name_last, :email, :latitude, :longitude)
  end

end
