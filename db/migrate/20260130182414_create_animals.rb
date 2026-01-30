class CreateAnimals < ActiveRecord::Migration[8.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.integer :species
      t.string :breed
      t.string :age
      t.integer :gender
      t.integer :size
      t.string :image
      t.string :city
      t.string :state
      t.text :description
      t.boolean :is_vaccinated
      t.boolean :is_neutered
      t.string :caregiver_name
      t.string :caregiver_whatsapp
      t.string :caregiver_instagram
      t.string :caregiver_facebook

      t.timestamps
    end
  end
end
