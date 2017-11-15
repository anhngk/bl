class Gia < ActiveRecord::Base
  belongs_to :hang_hoa

  validates :gia_ban, presence: true
end
