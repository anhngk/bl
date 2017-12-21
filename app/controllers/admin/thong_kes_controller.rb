class Admin::ThongKesController < Admin::ApplicationController


	def index
		@top_khach_hang	 = KhachHang.joins(:don_hangs).where("don_hangs.tinh_trang like ?", "Giao hàng thành công").select('SUM(tong_cong) as total', 'khach_hangs.id', 'khach_hangs.email', 'khach_hangs.ten_kh').group(:email).order('total desc').limit(10)
		# @doanh_thu_thang = DonHang.where("don_hangs.tinh_trang like ?", "Giao hàng thành công").select('SUM(tong_cong) as tong_doanh_thu_thang')
		 @doanh_thu_thang = DonHang.all.select('SUM(don_hangs.tong_cong) as doanh_thu', 'don_hangs.id', 'don_hangs.tong_cong').where("don_hangs.tinh_trang like ?", "Giao hàng thành công").group_by_month(:created_at)
		# @doanh_thu_thang = DonHang.select("date_trunc('month', created_at) as month, SUM(tong_cong) as total_doanh_thu" ).group('month')

		@don_hangs = DonHang.where('tinh_trang LIKE ?', 'Giao hàng thành công').group('month(created_at)').sum('tong_cong')
		@doanh_thu_month = @don_hangs.sum('tong_cong')

		@abc = KhachHang.joins(:don_hangs).where("don_hangs.tinh_trang like ?", "Giao hàng thành công").select('SUM(tong_cong) as total', 'khach_hangs.id', 'khach_hangs.email', 'khach_hangs.ten_kh').group_by_month(:created_at)
	end

end	