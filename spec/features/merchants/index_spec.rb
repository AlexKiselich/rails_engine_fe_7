require "rails_helper"

RSpec.describe "Merchants Index Page", type: :feature do
  describe "as a visitor, when I visit '/merchants'" do
    it "I should see a list of merchants by name" do

    visit "/merchants"
    params = {
      "controller"=>"merchants", "action"=>"index"
    }
    facade = MerchantsFacade.new(params)
    merchants = facade.merchants
    
    expect(page).to have_link("Schroeder-Jerde")
    expect(page).to have_link("#{merchants.first.name}")
    expect(page).to have_link("Klein, Rempel and Jones")
    expect(page).to have_link("Willms and Sons")
    end
  end
  it "when I click the merchant's name I should be on page '/merchants/:id'" do
    visit "/merchants"

    click_link "Willms and Sons"

    expect(page).to have_current_path("/merchants/3")
  end

  it "And I should see a list of items that merchant sells." do
    visit "/merchants"

    click_link "Willms and Sons"

    expect(page).to have_content("Item Enim Error")
    expect(page).to have_content("Item Delectus Dolorem")
    expect(page).to have_content("Item Delectus Dolorem")
    expect(page).to have_content("Item Ut Iusto")
  end
end