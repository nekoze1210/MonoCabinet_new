class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = current_user.items.order("created_at DESC")
  end

  def show
    @locations = @item.locations.includes(params[:item_id]).order("created_at DESC")
    # TODO: 以下のインスタンス変数は使わないかもしれないので、コメントアウト
    # @location = @item.locations.new
    # @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
    #   marker.lat location.latitude
    #   marker.lng location.longitude
    #   marker.infowindow location.created_at.strftime('%-m月%-d日 %H時%M分') + "に登録 (#{location.address})"
    #   marker.json({ address: location.address })
    #   # marker.picture({ url: view_context.image_path('logo.png'), width: 32, height: 32 })
    # end
    # @polylines = @hash.map{ |e| e.except(:infowindow, :address) }
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    item = Item.new(item_params)
    item.remote_image_url = SearchRakutenItemService.new(item.item_name).find_thumbnail if item.image.blank? && params[:use_rakuten]
    if item.save
      redirect_to user_items_path(current_user), notice: 'アイテムの情報が登録されました。'
    else
      flash[:alert] = 'Error!: アイテムの情報が登録されませんでした。'
      render :new
    end
  end

    def update
    if @item.update
      redirect_to controller: :items, action: :show
      notice[:success] = "アイテムの情報が更新されました!"
    else
      render :edit
    end
  end

  def destroy
    locations = @item.locations.where(item_id: params[:id])
    if @item.user_id == current_user.id
      @item.destroy
      locations.destroy_all
    end
    redirect_to controller: :items, action: :index
  end

  def search
    @items = Item.search(params[:q]).result
  end

  def tweet
    @item = current_user.items.find(params[:id])
    TweetPostedItemService.new.post_to_twitter(@item.item_name, @item.image.url)
    redirect_to root_path, notice: 'ok?'
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_search_q
    @q = current_user.items.search
  end

  def item_params
    params.require(:item)
    .permit(
      :item_name,
      :maker,
      :image,
      locations_attributes:
        [:latitude,
         :longitude,
         :user_id]).merge(user_id: current_user.id)
  end
end
