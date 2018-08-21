require 'rails_helper'

RSpec.feature 'Visitor navigates to login page', type: :feature, js: true do
  # SETUP
  before :each do
    @user1 = User.create(name:'Perry Mason', email:'perry@mason.com', password:'123', password_confirmation:'123')
  end

  scenario 'They sign in to their account' do
    # ACT
    visit root_path
    click_on 'Login'
    # puts page.html
    fill_in 'email', with: @user1.email
    fill_in 'password', with: @user1.password
    click_on 'Submit'



    # DEBUG / VERIFY
    expect(page).to have_content "Signed in as #{@user1.name}"


    save_screenshot

  end
end
