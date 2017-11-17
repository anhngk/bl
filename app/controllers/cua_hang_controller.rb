class CuaHangController < ApplicationController
  def index
  	@danh_mucs = DanhMuc.all
  end

  def show
  	@danh_muc = DanhMuc.find(params[:id])
  	@hang_hoas = @danh_muc.hang_hoas
  end
end
