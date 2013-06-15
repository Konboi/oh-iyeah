class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :user
      t.string :path
      t.string :facebook_pid
      t.string :facebook_objid
      t.string :thumbnail_url
      t.string :url
      t.timestamps
    end
    add_index :photos, :user_id
  end
end
