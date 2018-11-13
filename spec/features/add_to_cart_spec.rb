require 'rails_helper'

RSpec.feature "Verify Adding to cart", type: :feature, js: true do

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

  scenario "The cart count should increase when add button is clicked" do
    # ACT
    visit root_path
    click_button("Add")
    
    # save_screenshot

    expect(page).to have_text("My Cart (1)")
  end
end
