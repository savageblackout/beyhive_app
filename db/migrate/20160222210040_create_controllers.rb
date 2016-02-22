class CreateControllers < ActiveRecord::Migration
  def change
    create_table :controllers do |t|
      t.string :users

      t.timestamps null: false
    end
  end
end
