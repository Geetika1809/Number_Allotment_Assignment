class UpdateNumberToInteger < ActiveRecord::Migration[5.2]
  def change
  	change_column :phones, :number, :integer
  end
end
