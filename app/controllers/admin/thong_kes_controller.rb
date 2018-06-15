class Admin::ThongKesController < Admin::ApplicationController

	def index
		@top_khach_hang	 = KhachHang.top_khach_hang

		@doanh_thu_nam = HoaDonXuat.doanh_thu_nam
    @doanh_thu_theo_thang = HoaDonXuat.doanh_thu_theo_thang
     @doanh_thu_hom_nay = HoaDonXuat.doanh_thu_hom_nay
    @khach_hang_no = HoaDonXuat.khach_hang_no

    @no_nha_cung_cap = HoaDonNhap.no_nha_cung_cap
	end

end