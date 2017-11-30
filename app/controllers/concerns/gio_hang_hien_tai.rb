module GioHangHienTai
	extend ActiveSupport::Concern

	private
		def set_gio_hang
			@gio_hang = GioHang.find(session[:gio_hang_id])
		rescue ActiveRecord::RecordNotFound
			@gio_hang = GioHang.create
			session[:gio_hang_id] = @gio_hang.id
		end
end
