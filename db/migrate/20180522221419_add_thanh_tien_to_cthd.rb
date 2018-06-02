class AddThanhTienToCthd < ActiveRecord::Migration
  def change
    add_column :cthd_nhaps, :thanh_tien, :integer
    add_column :cthd_xuats, :thanh_tien, :integer
  end
end
