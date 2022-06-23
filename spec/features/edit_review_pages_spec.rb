require 'rails_helper'

describe "edit review" do
  before:each do
    product = Product.create(:name => 'Mars', :cost => '1.50', :origin => 'United States of America')
    review = Review.create(:author => 'Bob', :content_body => 'Blah Blah Blah lalallalalalalalalalalalalallaalalallaalalla.', :rating => '5', :product_id => product.id)
    visit products_path
    click_link 'Mars'
    click_link 'Bob'
  end
  
  it "edits a review" do
    click_link 'Edit Review'
    fill_in 'Author', :with => 'Jackie'
    click_on 'Update Review'
    expect(page).to have_content 'Jackie'
  end

  it "returns an error when author is left blank" do
    click_link 'Edit Review'
    fill_in 'Author', :with => ''
    click_button 'Update Review'
    expect(page).to have_content "Author can't be blank"
  end

  it "deletes a review" do
    click_on 'Delete Review'
    expect(page).not_to have_content 'Bob'
  end
end