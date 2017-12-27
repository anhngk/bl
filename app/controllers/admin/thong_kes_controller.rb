class Admin::ThongKesController < Admin::ApplicationController


	def index
		@top_khach_hang	 = KhachHang.top_khach_hang
		@doanh_thu_thang = DonHang.doanh_thu_thang
		@doanh_thu_nam = DonHang.doanh_thu_nam
	end

end	