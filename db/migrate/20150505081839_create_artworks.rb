class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :link
      t.text :description

      t.timestamps
    end
  end
end
