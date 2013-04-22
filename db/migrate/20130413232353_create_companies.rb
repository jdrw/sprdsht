class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :gmail
      t.string :gpassword
      t.string :drive_id

      t.timestamps
    end
  end
end
