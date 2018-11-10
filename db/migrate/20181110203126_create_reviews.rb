class CreateReviews < ActiveRecord::Migration
  def change

    drop_table :reviews

    create_table :reviews do |t|
      t.string :description
      t.string :text
      t.integer :rating
      t.references :product, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
