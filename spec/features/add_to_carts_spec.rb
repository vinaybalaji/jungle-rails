require 'rails_helper'

RSpec.feature "Clicking on Add to Cart updates the Cart", type: :feature, js: true do

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


  scenario "Clicking on any Add to Cart in the index page updates the cart to My Cart (1)" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    products = page.all('.actions')
    within(products[0]) do 
      find_link('Add').click
    end
    expect(page).to have_text 'My Cart (1)'
    save_screenshot
  end

end