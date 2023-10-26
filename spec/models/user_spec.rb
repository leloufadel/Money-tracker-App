require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'is valid with a name' do
    user.name = 'Jane Smith'
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'is valid with an email' do
    user.email = 'test@example.com'
    expect(user).to be_valid
  end

  it 'is not valid without a password' do
    user.password = nil
    expect(user).to_not be_valid
  end

  it 'has many categories' do
    expect(user).to respond_to(:categories)
  end

  it 'has many purchases' do
    expect(user).to respond_to(:purchases)
  end
end
