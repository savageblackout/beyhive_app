class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.text :text
      t.datetime :created_on

      t.timestamps null: false
    end
  end
end
