class CreateNhaCungCaps < ActiveRecord::Migration
  def change
    create_table :nha_cung_caps do |t|
      t.string :ncc_id
      t.string :ten_ncc
      t.string :ma_so_thue
      t.string :dia_chi
      t.string :dien_thoai
      t.text :ghi_chu
      t.decimal :tien_no

      t.timestamps null: false
    end
  end
end
