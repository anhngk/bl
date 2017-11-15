class CreateHangHoas < ActiveRecord::Migration
  def change
    create_table :hang_hoas do |t|
      t.string :ma_hang
      t.string :ten_hang
      t.string :xuat_xu
      t.string :dvt
      t.string :quy_cach
      t.text :ghi_chu
      t.integer :so_luong

      t.references :moderator, index: true, foreign_key: true
      t.references :danh_muc, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
