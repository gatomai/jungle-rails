require 'rails_helper'

RSpec.feature 'Visitor navigates to home page', type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario 'They click on a Product Link' do
    # ACT
    visit root_path
    # visit 'products/1'
    click_on 'Details'
    # puts page.html

    # DEBUG / VERIFY
    expect(page).to have_content 'Quantity', count: 1


    save_screenshot

  end
end
