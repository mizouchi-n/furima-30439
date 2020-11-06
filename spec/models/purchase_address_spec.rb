require 'rails_helper'
RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  it "tokenが空では登録できないこと" do
    @purchase_address.token = nil
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
  end 

end
