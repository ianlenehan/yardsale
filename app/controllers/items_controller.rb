class ItemsController < ApplicationController
  def index
    # @items = Item.all
    @items = Item.near([-33.8611625, 151.17], 20, :units => :km)
  end

  def new
    if !@currentUser.name
      redirect_to edit_user_path(@currentUser)
    else
      @item = Item.new
    end
  end

  def create
    req = Cloudinary::Uploader.upload( params[:item][:image] )
    @item = Item.create item_params
    if req
      @item.image = req["url"]
    end
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
    req = Cloudinary::Uploader.upload( params[:item][:image] ) if params[:item][:image]
    item = Item.find params[:id]
    item.image = req["url"] if req
    item.update item_params
    redirect_to item
  end

  def show
    @item = Item.find params[:id]
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :charity, :negotiable, :lat, :long, :category_id)
  end
end
