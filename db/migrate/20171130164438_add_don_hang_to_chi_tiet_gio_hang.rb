class AddDonHangToChiTietGioHang < ActiveRecord::Migration
  def change
    add_reference :chi_tiet_gio_hangs, :don_hang, index: true, foreign_key: true
  end
end
