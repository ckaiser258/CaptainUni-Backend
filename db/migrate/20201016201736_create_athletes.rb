class CreateAthletes < ActiveRecord::Migration[6.0]
  def change
    create_table :athletes do |t|
      t.string :image
      t.string :full_name
      t.string :phone_number
      t.string :address
      t.string :height
      t.integer :weight
      t.string :birthday
      t.string :positions
      t.string :high_school
      t.string :graduation_year
      t.float :gpa
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
