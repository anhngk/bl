class HangHoa < ActiveRecord::Base

	before_destroy :ensure_not_referenced_by_any_line_item


	has_attached_file 	:image,
						 styles: { large: "500x500>", medium: "300x300>", thumb: "183x183>", xs: "120x120>"},
						 default_url: "/images/:style/missing.png"

	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	validates :ten_hang, presence: true
	validates :so_luong, presence: true
	validates :dvt, presence:true

	belongs_to :moderator
	belongs_to :danh_muc

	has_many :gias, dependent: :destroy
	has_many :chi_tiet_gio_hangs
	has_many :don_hangs, through: :chi_tiet_gio_hangs

	accepts_nested_attributes_for 	:gias,
									allow_destroy: true,
									reject_if: proc { |att| att['gia_ban'].blank? }

	def self.tim_kiem search
		where("ten_hang LIKE ? OR xuat_xu LIKE ?", "%#{search}%", "%#{search}%")
	end

	private 
		def ensure_not_referenced_by_any_line_item
			if chi_tiet_gio_hangs.empty?
				return true
			else
				errors.add(:base, 'Tồn tại chi tiết giỏ hàng!')
				return false
			end
		end
end
