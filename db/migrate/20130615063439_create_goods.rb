class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.references :photo
      t.references :user
      t.timestamps
    end

    add_index :goods, :photo_id
    add_index :goods, :user_id
  end
end
