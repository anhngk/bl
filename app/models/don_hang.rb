class DonHang < ActiveRecord::Base

	belongs_to :khach_hang
	
	after_initialize :set_defaults, unless: :persisted?
	has_many :chi_tiet_gio_hangs, dependent: :destroy

	KIEU_THANH_TOAN = ["Chuyển khoản", "Thanh toán tại cửa hàng", "Thanh toán khi nhận hàng"]
	TINH_TRANG = [ "Đã tiếp nhận", "Đang xử lý", "Đã chuẩn bị xong", "Đang giao hàng", "Giao hàng thành công" ]

	validates :nguoi_nhan, :dia_chi, :email, presence: true
	validates :kieu_thanh_toan, inclusion: KIEU_THANH_TOAN

	def set_defaults
		self.tinh_trang ||= 'Đã tiếp nhận'
	end

	def them_chi_tiet_tu_gio_hang(gio_hang)
		gio_hang.chi_tiet_gio_hangs.each do |item|
			item.gio_hang_id = nil
			chi_tiet_gio_hangs << item
		end
	end

	def tong_cong
		chi_tiet_gio_hangs.to_a.sum {|chi_tiet| chi_tiet.tong_cong}
	end
end