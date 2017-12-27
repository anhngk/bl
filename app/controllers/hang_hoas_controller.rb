class HangHoasController < ApplicationController

  layout 'store'


  include GioHangHienTai
  before_action :set_gio_hang

  def index

    if params[:search].present?
      @hang_hoas = HangHoa.tim_kiem(params[:search]).page(params[:page]).per(8)

  	elsif params[:danh_muc_id].blank?
  		@danh_muc = DanhMuc.first
  		@hang_hoas = @danh_muc.hang_hoas.page(params[:page]).per(8)

  	else
  		@danh_muc_id = DanhMuc.find_by(id: params[:danh_muc_id]).id
  		@danh_muc = DanhMuc.find_by(id: params[:danh_muc_id])
  		@hang_hoas = HangHoa.where(danh_muc_id: @danh_muc_id).page(params[:page]).per(8)
  	end
  end

  def show
    @chi_tiet_gio_hang = ChiTietGioHang.new
    @hang_hoa = HangHoa.find(params[:id])
    @gia = Gia.find(params[:id])
  end
end
