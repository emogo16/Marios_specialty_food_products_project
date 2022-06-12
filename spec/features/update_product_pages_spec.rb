require 'rails_helper'

describe "edit product process" do
  it "edits a product" do
    product = Product.create(:name => 'Burrito', :cost => '1.50', :origin => "Mexico")
    visit edit_product_path(product)
    fill_in 'Name', :with => 'Tacos'
    click_on 'Update Product'
    expect(page).to have_content 'Tacos'
  end

  it "returns an error if description is left blank" do
    product = Product.create(:name => 'Burrito', :cost => '1.50', :origin => 'Mexico')
    visit edit_product_path(product)
    fill_in 'Name', :with => ''
    click_button 'Update Product'
    expect(page).to have_content 'errors'
  end

  it "delete a product" do
    product = Product.create(:name => 'Burrito', :cost => '1.50', :origin => 'Mexico')
    visit product_path(product)
    click_button 'Delete Product'
    expect(page).not_to have_content 'Mexican'
  end
end