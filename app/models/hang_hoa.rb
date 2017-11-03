class HangHoa < ActiveRecord::Base
	has_attached_file :image, style: { large: "500x500>", medium: "300x300>", thumb: "200x200#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	belongs_to :moderator

	has_many :danh_mucs, through: :danh_muc_hang_hoas
	has_many :gias
end
