class AddKhachHangToDonHang < ActiveRecord::Migration
  def change
    add_reference :don_hangs, :khach_hang, index: true, foreign_key: true
  end
end
