class Investor < ApplicationRecord
  has_many :addresses
  accepts_nested_attributes_for :addresses
  has_one_attached :document

  validates :first_name, :last_name, :date_of_birth, :phone_number, presence: true
  validates :phone_number, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }, allow_blank: true
  validates :addresses, length: { minimum: 1 }
  validate :validate_zip_code

  def full_name
    first_name + " " + last_name
  end

  private

  def validate_zip_code
    addresses.each do |address|
      if address.zip_code.present? && address.zip_code !~ /\A\d{5}\z/
        errors.add(:base, "Zip code must be 5 digits")
      end
    end
  end
end
