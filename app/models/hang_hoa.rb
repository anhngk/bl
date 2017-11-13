class HangHoa < ActiveRecord::Base
	has_attached_file 	:image,
						 styles: { large: "500x500>", medium: "300x300>", thumb: "200x200#"},
						 default_url: "/images/:style/missing.png"

	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	belongs_to :moderator

	has_many :danh_mucs, through: :danh_muc_hang_hoas
	has_many :gias, dependent: :destroy

	accepts_nested_attributes_for 	:gias,
									allow_destroy: true,
									reject_if: proc { |att| att['gia_ban'].blank? }
end
