require 'rails_helper'

describe "add a product" do
  before:each do
    visit new_product_path
  end
  
  it "adds a new product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'Mars'
    fill_in 'Cost', :with => '2'
    fill_in 'Origin', :with => 'United States of America'
    click_on 'Create Product'
    expect(page).to have_content 'Products'
  end

  it "gives an error if it is left blank" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'Can not be left blank, please fix:'
  end
end