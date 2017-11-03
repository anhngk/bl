class DanhMucHangHoa < ActiveRecord::Base
  belongs_to :danh_muc
  belongs_to :hang_hoa
end
