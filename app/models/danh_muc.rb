class DanhMuc < ActiveRecord::Base
	has_many :hang_hoas
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	validates :ten_danh_muc, presence: true

	def dang_su_dung?
		HangHoa.exists?(danh_muc_id: self.id)
	end
end
	