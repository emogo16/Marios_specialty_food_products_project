class Review < ApplicationRecord
  belongs_to :product

  validates :author, :presence => true
  validates :content_body, {:presence => true, :length => { :minimum => 50, :maximum => 250 }}
  validates :rating, :presence => true
  
  before_save(:titlelize_review)

  private 
    def titlelize_review
      self.author =  self.author.titleize
    end
end