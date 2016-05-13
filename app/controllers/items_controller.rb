class ItemsController < ApplicationController
  def index
    session[:radius] += params[:km].to_i if params[:km].present?
    session[:radius] = 5 if params[:radius].present?
    session[:category] = params[:category] if params[:category].present?
    user = @currentUser

    if @currentUser.present? && user.current_latitude.to_s.length
      lat = user.current_latitude
      long = user.current_longitude
    elsif @currentUser.present? && user.latitude.to_s.length
      lat = user.latitude
      long = user.longitude
    end

    if !@currentUser.present?
      @items = Item.all
      puts "no user present"

    elsif params[:favourites].present?
      favourites = Favourite.where(user_id: @currentUser.id)
      favourites_item_ids = []
      favourites.each do |f|
        favourites_item_ids.push f.item_id
      end
      items = Item.where(id: favourites_item_ids)
      puts 'gone to favourites'
      lat = user.latitude
      long = user.longitude
      @items = items.near([lat, long], 200, units: :km)

    elsif params[:category].present? && params[:category] != ''
      puts 'gone to category'
      category = Category.where(name: params[:category]).first
      items = Item.near([lat, long], session[:radius], units: :km)
      @items = items.where(category_id: category.id)

    elsif params[:category] == '' || !params[:category] || params[:radius].present?
      puts 'clear category'
      @items = Item.near([lat, long], session[:radius], units: :km)
    end

    render :index, layout: ! (params[:km].present? || params[:category].present? || params[:radius].present? || params[:favourites].present?)
  end

  def admin
    @items = Item.all
  end

  def close
    item = Item.find params[:id]
    item.closed = Date.today
    item.save
    redirect_to items_path
  end

  def reopen
    item = Item.find params[:id]
    item.closed = nil
    item.save
    redirect_to item_path(item)
  end

  def new
    if !@currentUser.name_first
      redirect_to edit_user_path(@currentUser)
    else
      @item = Item.new
    end
  end

  def create
    req = Cloudinary::Uploader.upload(params[:item][:image])
    @item = Item.create item_params
    @item.user_id = @currentUser.id
    @item.image = req['url'] if req
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find params[:id]
  end

  def update
    req = Cloudinary::Uploader.upload(params[:item][:image]) if params[:item][:image]
    item = Item.find params[:id]
    item.image = req['url'] if req
    item.update item_params
    redirect_to item
  end

  def show
    @item = Item.find params[:id]
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :charity, :negotiable, :latitude, :longitude, :category_id)
  end
end
