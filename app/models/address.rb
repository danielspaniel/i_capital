class Address < ApplicationRecord
  belongs_to :investor
  validates :street, :state, :zip_code, presence: true
  validates :zip_code, format: { with: /\A\d{5}\z/, message: "Zip code must be 5 digits" }
end
