class SpecialtyPurchaseDestination < ApplicationRecord
  belongs_to :ingredient

  validates :company_name, :ingredient_id, presence: true 
end
