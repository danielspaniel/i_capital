class Investor < ApplicationRecord
  has_many :addresses
  accepts_nested_attributes_for :addresses
  has_one_attached :document

  validates :first_name, :last_name, :date_of_birth, :phone_number, presence: true
  validates :phone_number, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }, allow_blank: true
  validates :addresses, length: { minimum: 1 }

  def full_name
    first_name + " " + last_name
  end
end
