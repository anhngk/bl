class CreateDanhMucs < ActiveRecord::Migration
  def change
    create_table :danh_mucs do |t|
      t.string :ten_danh_muc
      t.text :mota

      t.timestamps null: false
    end
  end
end
