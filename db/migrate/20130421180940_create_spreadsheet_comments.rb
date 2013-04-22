class CreateSpreadsheetComments < ActiveRecord::Migration
  def change
    create_table :spreadsheet_comments do |t|
      t.integer :employee_id
      t.string :username
      t.text :content
      t.integer :commented_on

      t.timestamps
    end
  end
end
