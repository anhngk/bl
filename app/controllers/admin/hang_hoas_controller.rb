class Admin::HangHoasController < Admin::ApplicationController

  def index
    @hang_hoas = HangHoa.includes(:gias).all
  end

  def new
    @hang_hoa = HangHoa.new
    @danh_mucs = DanhMuc.all.map{|c| [c.ten_danh_muc, c.id]}
    @hang_hoa.gias.build.build_hang_hoa
  end

  def create
    @hang_hoa = HangHoa.new(hang_hoa_params)
    @hang_hoa.moderator_id = current_moderator.id

    if @hang_hoa.save
      redirect_to admin_hang_hoas_url, notice: 'Thêm hàng hóa thành công'
    else
      flash[:alert] = 'Có lỗi khi tiến hành thêm hàng hóa'
      render 'new'
    end
  end

  def edit
    @hang_hoa = HangHoa.find(params[:id])
    @danh_mucs = DanhMuc.all.map{|c| [c.ten_danh_muc, c.id]}
  end

  def update
    @hang_hoa = HangHoa.find(params[:id])
    @hang_hoa.danh_muc_id = params[:danh_muc_id]
    if @hang_hoa.update(hang_hoa_params)
      redirect_to admin_hang_hoas_url, notice: 'Cập nhật hàng thành công!'
    else
      flash[:alert] = 'Có lỗi xảy ra khi cập nhật hàng'
      render :edit
    end
  end

  def show
    @hang_hoa = HangHoa.find(params[:id])
    @gia = Gia.find(params[:id])
  end

  def destroy
    @hang_hoa = HangHoa.find(params[:id])
    @hang_hoa.destroy

    redirect_to :back, notice: 'Xóa thành công'
  end

  private

  def hang_hoa_params
    params.require(:hang_hoa).permit(
      :ma_hang, :ten_hang, :so_luong, :dvt, :xuat_xu, :quy_cach, :ghi_chu, :chi_tiet, :image, :ten_danh_muc, :danh_muc_id,
      gias_attributes: [ :gia_ban],
    )
  end

end
