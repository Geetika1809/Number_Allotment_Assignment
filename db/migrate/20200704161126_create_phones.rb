class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.string :number
      t.boolean :available

      t.timestamps
    end
  end
end
