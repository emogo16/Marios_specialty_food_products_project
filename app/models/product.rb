class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  scope :last_three, -> { order(created_at: :desc).limit(3) }
  scope :usa, -> { where(country_of_origin: "USA") }
  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, products.country_of_origin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}
  scope :search, -> (name_parameter) { where("name ilike ?", "%#{name_parameter}%")}  

  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true

  before_save(:titleize_product)

  private
    def titleize_product
      self.name = self.name.titleize
    end
end