class Address < ApplicationRecord
  belongs_to :investor
  validates :street, :state, :zip_code, presence: true
end
