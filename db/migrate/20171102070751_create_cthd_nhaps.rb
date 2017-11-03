class CreateCthdNhaps < ActiveRecord::Migration
  def change
    create_table :cthd_nhaps do |t|
      t.string :ma_cthd_nhap
      t.integer :so_luong_nhap
      t.decimal :gia_nhap
      t.references :hoa_don_nhap, index: true, foreign_key: true
      t.references :hang_hoa, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
