class CreateKhachHangs < ActiveRecord::Migration
  def change
    create_table :khach_hangs do |t|
      t.string :kh_id
      t.string :ten_kh
      t.string :ma_so_thue
      t.string :dia_chi
      t.string :dien_thoai
      t.text :ghi_chu
      t.decimal :tien_no

      t.timestamps null: false
    end
  end
end
