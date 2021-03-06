require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
  @order = FactoryBot.build(:order)
  end
   
  context"全ての情報が正しく入っていれば購入できる" do
    it '全項目埋まっていると購入できる' do
        expect(@order).to be_valid
      end
    
      it "建物名がなくても購入できること" do
        @order.building = nil
        expect(@order).to be_valid
      end
  end


  it "全ての情報が正しく入っていれば購入できる" do
  end

  it "郵便番号が空では登録できないこと" do
    @order.postalcode = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Postalcode can't be blank")
  end

  it "都道府県が空では登録できないこと" do
    @order.prefecture_id = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Prefecture can't be blank")
  end

  it "市区町村が空では登録できないこと" do
    @order.municipality = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Municipality can't be blank")
  end

  it "番地が空では登録できないこと" do
    @order.address = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Address can't be blank")
  end


  it "電話番号が空では登録できないこと" do
    @order.phone = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone can't be blank")
  end

  it "電話番号にハイフンがある登録できないこと" do
    @order.postalcode = "000-0000-0000"
    @order.valid?
    expect(@order.errors.full_messages).to include("Postalcode is invalid")
  end

  it "郵便番号にハイフンがないと登録できないこと" do
    @order.postalcode = "0000000"
    @order.valid?
    expect(@order.errors.full_messages).to include("Postalcode is invalid")
  end

  it "電話番号が12文字以上だと登録できないこと" do
    @order.phone = "090000000000"
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone is invalid")
  end
  
end

