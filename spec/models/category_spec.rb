# spec/models/category_spec.rb
require 'rails_helper'

RSpec.describe Category, type: :model do
  
  it 'is not valid without a name' do
    category = Category.new(icon: 'test_icon')
    expect(category).to_not be_valid
  end

  it 'is not valid without an icon' do
    category = Category.new(name: 'Test Category')
    expect(category).to_not be_valid
  end
end