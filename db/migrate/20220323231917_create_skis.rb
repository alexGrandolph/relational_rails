class CreateSkis < ActiveRecord::Migration[5.2]
  def change
    create_table :skis do |t|
      t.references :ski_maker, foreign_key: true
      t.string :model
      t.string :ski_type
      t.integer :longest_offered_cm
      t.boolean :symmetrical

      t.timestamps
    end
  end
end
