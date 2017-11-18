class HangHoasController < ApplicationController
  def index
  	if params[:danh_muc].blank?
  		@danh_muc = DanhMuc.first
  		@hang_hoas = @danh_muc.hang_hoas
  	else
  		@danh_muc_id = DanhMuc.find_by(ten_danh_muc: params[:danh_muc]).id
  		@danh_muc = DanhMuc.find_by(ten_danh_muc: params[:danh_muc])
  		@hang_hoas = HangHoa.where(danh_muc_id: @danh_muc_id)
  	end
  end

  def show
  end
end
