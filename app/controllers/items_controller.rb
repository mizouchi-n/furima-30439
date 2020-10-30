class ItemsController < ApplicationController
 
  before_action :authenticate_user!, except: :index 
  

    def index
        @items = Item.all
    end
    def new
        @item = Item.new
    end   

    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to root_path
        else
          render :new
        end 
    end

    def edit
    end

    def update
        if current_user.update(item_params)
           redirect_to root_path
        else
            render :new
        end
    end

    private
    
    def item_params
        params.require(:item).permit(:image,:name,:description,:price,:category_id,:status_id, :burden_id,:area_id, :day_id,user_ids: [] ).merge(user_id: current_user.id)
    end

    def redirect_root
        redirect_to new_user_session_path unless user_signed_in?
    end
end
