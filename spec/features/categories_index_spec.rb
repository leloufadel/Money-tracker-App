require 'rails_helper'

RSpec.describe 'Recipe management', type: :feature do
  before(:each) do
    DatabaseCleaner.clean
  end

  before(:each) do
    user = FactoryBot.create(:user, name: 'John Doe')
    visit new_user_session_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password123'
    click_button 'Log in'
    sleep(1)
  end

  it 'allows a user to create a category' do
    visit new_category_path
    fill_in 'category[name]', with: 'Apple Pie'
    fill_in 'category[icon]', with: 'https://media.licdn.com/dms/image/D4D35AQHcAKVJchre-Q/profile-framedphoto-shrink_200_200/0/1690870818730?e=1698973200&v=beta&t=gDHPAjC-Jc_A76RBcbz5HPUdw_w06248YcJvskiT2pY'

    within('form') do
      click_button 'Save'
    end

    sleep(2)
    expect(page).to have_text('Apple Pie')
  end
end
