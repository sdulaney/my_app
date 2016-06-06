class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.references :user, index: true, foreign_key: true
      t.string :url
      t.string :review

      t.timestamps null: false
    end
  end
end
