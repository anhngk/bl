class KhachHang < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    has_many :don_hangs
    has_many :hoa_don_xuats
    ratyrate_rater
    devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

    accepts_nested_attributes_for 	:don_hangs,
									allow_destroy: true


	def self.top_khach_hang
		KhachHang.joins(:don_hangs)
				.select('SUM(tong_cong) as total', 'khach_hangs.id', 'khach_hangs.email', 'khach_hangs.ten_kh')
				.where("don_hangs.tinh_trang like ?", "Giao hàng thành công")
				.group(:email)
				.order('total desc')
				.limit(10)
	end

  def tien_no
    self.tien_no = hoa_don_xuats.where(tinh_trang: false).sum(:tong_tien)
  end

end
