class CreateCthdXuats < ActiveRecord::Migration
  def change
    create_table :cthd_xuats do |t|
      t.string :ma_cthd_xuat
      t.integer :so_luong_xuat
      t.integer :gia_ban
      t.references :hang_hoa, index: true, foreign_key: true
      t.references :hoa_don_xuat, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
