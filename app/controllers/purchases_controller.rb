class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :buy_action, only:[:index]
    def index 
        @purchase_address = PurchaseAddress.new   
    end
  
    def create 
      @purchase_address = PurchaseAddress.new(purchase_address_params)
    
      if @purchase_address.valid?
        pay_item
         @purchase_address.save
         return redirect_to root_path
      else
      render 'index'
      end
    end

    def show 
    end

  private

  def purchase_address_params
    params.permit(:postalcode,:prefecture_id,:municipality,:address,:building,:phone,:item_id,:price,:token).merge(user_id: current_user.id)
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card:  purchase_address_params[:token],    
      currency: 'jpy'                 
    )
  end

  def set_item
    @item =Item.find(params[:item_id])
  end 

  def buy_action
    if @item.purchase != nil
      redirect_to root_path
   else 
     if user_signed_in?  
       if current_user.id == @item.user_id 
         redirect_to root_path 
       end 
     else
       redirect_to  new_user_session_path
     end
   end
  end
end

