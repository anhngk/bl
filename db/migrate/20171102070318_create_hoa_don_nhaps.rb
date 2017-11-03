class CreateHoaDonNhaps < ActiveRecord::Migration
  def change
    create_table :hoa_don_nhaps do |t|
      t.string :ma_hd_nhap
      t.datetime :ngaynhap
      t.decimal :tong_tien
      t.text :ghi_chu
      t.boolean :tinh_trang
      t.references :nha_cung_cap, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
