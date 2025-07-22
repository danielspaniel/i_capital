class AddInitialModels < ActiveRecord::Migration[8.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.timestamps
    end

    create_table :investors do |t|
      t.belongs_to :partner
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :phone_number
      t.timestamps
    end

    create_table :addresses do |t|
      t.belongs_to :investor
      t.string :street
      t.string :state
      t.string :zip_code
      t.timestamps
    end
  end
end
