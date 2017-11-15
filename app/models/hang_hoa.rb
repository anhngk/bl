class HangHoa < ActiveRecord::Base
	has_attached_file 	:image,
						 styles: { large: "500x500>", medium: "300x300>", thumb: "200x200#"},
						 default_url: "/images/:style/missing.png"

	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	validates :ten_hang, presence: true
	validates :so_luong, presence: true
	validates :dvt, presence:true

	belongs_to :moderator
	belongs_to :danh_muc

	has_many :gias, dependent: :destroy

	accepts_nested_attributes_for 	:gias,
									allow_destroy: true,
									reject_if: proc { |att| att['gia_ban'].blank? }
end
