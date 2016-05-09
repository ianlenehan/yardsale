class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def edit
  end

  def show
    @user = @currentUser
  end

  def verify
    returned_key = params["authHeader"].split("=")[1][1, 25]
    returned_api_url = params["apiUrl"]
    my_key = 'e1SWhR3fwM8ftCJw0uQ93mY3J'
    options = {
      headers: {
        'Authorization': params["authHeader"]
      }
    }
    if returned_key == my_key && (returned_api_url[0, 18] == "https://api.digits" || returned_api_url[0, 19] == "http://api.twitter")
      @verification = HTTParty.get("#{returned_api_url}", options)
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


end
