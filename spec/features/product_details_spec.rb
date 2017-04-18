require 'rails_helper'

RSpec.feature "User navigates from home page to product detail page", type: :feature, js: true do

    # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end


  scenario "Navigate to product detail page when click on Details" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    products = page.all('.actions')
    within(products[0]) do 
      find_link('Details').click
    end
    expect(page).to have_text 'Description'
    save_screenshot
  end

end