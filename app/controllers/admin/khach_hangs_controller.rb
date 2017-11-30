class Admin::KhachHangsController < Admin::ApplicationController

	def index
		@khach_hangs = KhachHang.all
	end

end