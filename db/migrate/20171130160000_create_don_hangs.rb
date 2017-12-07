class CreateDonHangs < ActiveRecord::Migration
  def change
    create_table :don_hangs do |t|
      t.string :nguoi_nhan
      t.string :dia_chi
      t.string :sdt
      t.string :email
      t.string :tinh_trang
      t.boolean :thanh_toan
      t.string :kieu_thanh_toan

      t.timestamps null: false
    end
  end
end
