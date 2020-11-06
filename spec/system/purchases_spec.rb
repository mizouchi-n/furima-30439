require 'rails_helper'

RSpec.describe "Purchases", type: :system do
  before do
    @purchase = FactoryBot.build(:purchase)
  end
