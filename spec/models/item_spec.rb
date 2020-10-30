require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
    
  end 
  describe '商品情報を入力する' do
    it "全項目埋まっていると保存できる" do
      expect(@item).to be_valid
    end
  end

    it "商品名が空欄だと保存できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include( "Name can't be blank")
    end

    it "商品の説明が空欄だと保存できない" do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "カテゴリーの情報が空欄だと保存できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end

    it "カテゴリーの情報が選択できていないと保存できない" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end


    it "商品の状態についての情報が空だと保存できない" do
      @item.status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it "商品の状態についての情報が選択できていないと保存できない" do
      @item.status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it "配送料の負担についての情報が空だと保存できない" do
      @item.burden_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden can't be blank")
    end

    it "配送料の負担についての情報が選択できていないと保存できない" do
    @item.burden_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden must be other than 1")
    end

    it "発送先の地域についての情報が空だと保存できない" do
      @item.area_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end

    it "発送先の地域についての情報が選択できていないと保存できない" do
      @item.area_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 1")
    end

    it "発送までの日数についての情報が空だと保存できない" do
      @item.day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank")
    end

    it "発送までの日数についての情報が選択できていないと保存できない" do
      @item.day_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Day must be other than 1")
    end

    it "販売価格についての情報が空だと保存できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "販売価格についての情報が全角だと保存できない" do
      @item.price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it "販売価格についての情報が半角英数字混合だと保存できない" do
      @item.price = "1a2b3c"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it "販売価格についての情報が299より下だと保存できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it "販売価格についての情報が10000000より上だと保存できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it "画像がないと出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include( "Image can't be blank")
    end

  
end
