class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :image_url
      t.string :date
      t.string :place
      t.string :station
      t.text :detail

      t.timestamps
    end
  end
end
