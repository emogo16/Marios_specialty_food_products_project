require 'rails_helper'

describe "add a review process" do
  it "adds a review" do
    product = Product.create(:name => 'Burrito', :cost => '1.50', :origin => 'Mexico')
    visit product_path(product)
    click_link 'Write a Review'
    fill_in 'Author', :with => "Bob"
    fill_in 'Content body', :with => "Blah Blah Blah lalallalalalalalalalalalalla."
    fill_in 'Rating', :with => 3
    click_on 'Create Review'
    expect(page).to have_content 'Burrito'
  end

  it "returns an error if form left blank" do
    product = Product.create(:name => 'Burrito', :cost => '1.50', :origin => 'Mexico')
    visit new_product_review_path(product)
    click_on 'Create Review'
    expect(page).to have_content 'errors'
  end
end