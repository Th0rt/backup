class CreateRelFavoriteMicroposts < ActiveRecord::Migration[5.0]
  def change
    create_table :rel_favorite_microposts do |t|
      t.references :user, foreign_key: true
      t.references :micropost, foreign_key: true

      t.timestamps
      t.index [:user_id, :micropost_id], unique: true
    end
  end
end
