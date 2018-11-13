require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do

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

  scenario "User shoud be able to click and redirect /product/:id" do
    # ACT
    visit root_path
    click_link(@category.products.first.name)

    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_text(@category.products.first.name)
  end
end
