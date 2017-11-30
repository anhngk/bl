class GomCacMucTrongGioHang < ActiveRecord::Migration
  def up
  	GioHang.all.each do |gio_hang|
  		tong = gio_hang.chi_tiet_gio_hangs.group(:hang_hoa_id).sum(:so_luong)

  		tong.each do |hang_hoa_id, so_luong|
  			gio_hang.chi_tiet_gio_hangs.where(hang_hoa_id: hang_hoa_id).delete_all

  			item = gio_hang.chi_tiet_gio_hangs.build(hang_hoa_id: hang_hoa_id)
  			item.so_luong = so_luong
  			item.save!
  		end
  	end
  end

  def down
  	ChiTietGioHang.where("so_luong>1").each do |chi_tiet|
  		chi_tiet.so_luong.times do
  			ChiTietGioHang.create gio_hang_id: chi_tiet.gio_hang_id,
  				hang_hoa_id: chi_tiet.hang_hoa_id, so_luong: 1
  		end
  		chi_tiet.destroy
  	end
  end

end
