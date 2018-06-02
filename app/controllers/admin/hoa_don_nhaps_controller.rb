class Admin::HoaDonNhapsController < Admin::ApplicationController
  before_action :set_hoa_don_nhap, only: [:show, :edit, :update, :destroy]

  def index
    @hoa_don_nhaps = HoaDonNhap.all
  end

  def show
  end

  def new
    @hoa_don_nhap = HoaDonNhap.new
    @nha_cung_caps = NhaCungCap.all
    @hang_hoas = HangHoa.all
    @hoa_don_nhap.cthd_nhaps.build
  end

  def create
    @hoa_don_nhap = HoaDonNhap.new(hoa_don_nhap_params)
    respond_to do |format|
      if @hoa_don_nhap.save
        format.html { redirect_to @hoa_don_nhap, notice: 'Thêm hóa đơn thành công' }
        format.json { redirect_to admin_hoa_don_nhaps_url }
      else
        format.html { render :new }
        format.json { render json: @hoa_don_nhap.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @hoa_don_nhap.update(hoa_don_nhap_params)
        format.html { redirect_to admin_hoa_don_nhaps_url, notice: 'Cập nhật hóa đơn thành công!' }
        format.json { render :show, status: :ok, location: @hoa_don_nhap }
      else
        format.html { render :edit }
        format.json { render json: @hoa_don_nhap.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hoa_don_nhap.destroy
    respond_to do |format|
      format.html { redirect_to admin_hoa_don_nhaps_url, notice: 'Xóa thành công' }
      format.json { render json: @hoa_don_nhap.errors, status: :unprocessable_entity }
    end
  end

private

  def set_hoa_don_nhap
    @hoa_don_nhap = HoaDonNhap.find(params[:id])
  end

  def hoa_don_nhap_params
    params.require(:hoa_don_nhap).permit(:id, :ngaynhap, :tong_tien, :ghi_chu, :tinh_trang, :nha_cung_cap_id, cthd_nhaps_attributes: [:id, :so_luong_nhap, :hang_hoa_id, :gia_nhap])
  end


end