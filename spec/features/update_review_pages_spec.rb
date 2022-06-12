require 'rails_helper'

describe "edit review" do
  it "edits a review" do
    product = Product.create(:name => 'Burrito', :cost => '1.50', :origin => 'Mexico')
    review = Review.create(:author => 'Bob', :content_body => 'Blah Blah Blah lalallalalalalalalalalalallaa.', :rating => '5', :product_id => product.id)
    visit edit_product_review_path(product, review)
    fill_in 'Author', :with => 'Jackie'
    click_on 'Update Review'
    expect(page).to have_content 'Jackie'
  end

  it "reutrns an error when author is left blank" do
    product = Product.create(:name => 'Burrito', :cost => '1.50', :origin => 'Mexico')
    review = Review.create(:author => 'Bob', :content_body => 'Blah Blah Blah lalallalalalalalalalalalalla.', :rating => '5', :product_id => product.id)
    visit edit_product_review_path(product, review)
    fill_in 'Author', :with => ''
    click_button 'Update Review'
    expect(page).to have_content 'errors'
  end

  it "deletes a review" do
    product = Product.create(:name => 'Burrito', :cost => '1.50', :origin => 'Mexico')
    review = Review.create(:author => 'Bob', :content_body => 'Blah Blah Blah lalallalalalalalalalalalalla.', :rating => '5', :product_id => product.id)
    visit product_review_path(product, review)
    click_on 'Delete Review'
    expect(page).not_to have_content 'Blah Blah Blah lalallalalalalalalalalalalla.'
  end
end