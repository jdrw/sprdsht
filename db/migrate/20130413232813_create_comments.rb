class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :discussable, :polymorphic => true
      t.text :content

      t.timestamps
    end
    add_index :comments, :discussable_id
  end
end
