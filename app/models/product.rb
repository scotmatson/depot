class Product < ActiveRecord::Base
  #Spanish EDIT validation
  validates :title_es, :description_es, presence: true
  #English EDIT validation
  validates :title, :description,  presence: true
 
  validates :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :description, length: {minimum: 10}


  def self.latest
    Product.order(:updated_at).last
  end

  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
