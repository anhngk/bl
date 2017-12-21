class GioHang < ActiveRecord::Base
	has_many :chi_tiet_gio_hangs, dependent: :destroy

	def them_hang_hoa(hang_hoa_id, so_luong)
		current_item = chi_tiet_gio_hangs.find_by(hang_hoa_id: hang_hoa_id)
		if current_item
			current_item.so_luong += so_luong.to_i
		else
			current_item = chi_tiet_gio_hangs.build(hang_hoa_id: hang_hoa_id)
			current_item.so_luong += so_luong.to_i - 1
		end
		current_item
	end


	def tong_cong
		chi_tiet_gio_hangs.to_a.sum {|chi_tiet| chi_tiet.tong_cong}
	end

end
