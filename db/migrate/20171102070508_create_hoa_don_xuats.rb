class CreateHoaDonXuats < ActiveRecord::Migration
  def change
    create_table :hoa_don_xuats do |t|
      t.string :ma_hd_xuat
      t.datetime :ngay_xuat
      t.decimal :tong_tien
      t.text :ghi_chu
      t.boolean :tinh_trang
      t.references :khach_hang, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
