class AddSoLuongToChiTietGioHangs < ActiveRecord::Migration
  def change
    add_column :chi_tiet_gio_hangs, :so_luong, :integer, default: 1
  end
end
