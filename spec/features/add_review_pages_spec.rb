require 'rails_helper'

describe "add a review process" do
  before:each do
    visit new_product_path
  end
  
  it "adds a review" do
    product = Product.create(:name => 'Mars', :cost => '1.50', :origin => 'United States of America')
    visit product_path(product)
    click_link 'Edit'
    save_and_open_page
    fill_in 'Name', :with => "Bob"
    # save_and_open_page
    fill_in 'Content body', :with => "Blah Blah Blah lalallalalalalalalalalalalla."
    fill_in 'Rating', :with => 3
    click_on 'Create Review'
    expect(page).to have_content 'Mars'
  end

  it "returns an error if form left blank" do
    product = Product.create(:name => 'Mars', :cost => '1.50', :origin => 'United States of America')
    visit new_product_review_path(product)
    click_on 'Create Review'
    expect(page).to have_content 'Can not be left blank, please fix:'
  end
end