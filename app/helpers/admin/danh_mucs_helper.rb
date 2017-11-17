module Admin::DanhMucsHelper

	def create_deletable_button danh_muc 
		if danh_muc.dang_su_dung?
			link_to '#' do
				content_tag(:button, 'Xóa', class: 'disabled')
			end
		else
			link_to admin_danh_muc_path(danh_muc), method: :delete do
				content_tag(:button, 'Xóa')
			end
		end
	end
end
