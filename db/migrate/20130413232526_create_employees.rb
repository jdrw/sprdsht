class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :username
      t.string :name
      t.integer :company_id

      t.timestamps
    end
  end
end
