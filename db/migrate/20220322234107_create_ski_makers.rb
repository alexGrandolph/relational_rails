class CreateSkiMakers < ActiveRecord::Migration[5.2]
  def change
    create_table :ski_makers do |t|
      t.string :company_name
      t.integer :years_active
      t.boolean :makes_snowboards

      t.timestamps
    end
  end
end
