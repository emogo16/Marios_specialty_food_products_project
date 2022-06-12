require 'rails_helper'

describe "add a product" do
  it "adds a new product" do
    visit products_path
    click_link "Create new product"
    fill_in 'Name', :with => "Burrito"
    fill_in 'Cost', :with => "1.50"
    select 'Mexico', :from => 'product_origin'
    click_on 'Create Product'
    expect(page).to have_content 'Products'
  end

  it "gives an error if it is left blank" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'Can not be left blank'
  end
end