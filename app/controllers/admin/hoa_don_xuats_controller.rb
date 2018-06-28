class Admin::HoaDonXuatsController < Admin::ApplicationController
  before_action :set_hoa_don_xuat, only: [:show, :edit, :update, :destroy]

  def index
    @hoa_don_xuats = HoaDonXuat.all.order(ngay_xuat: :desc)
  end

  def show
  end

  def new
    @hoa_don_xuat = HoaDonXuat.new
    @khach_hangs = KhachHang.all
    @hang_hoas = HangHoa.all
    @hoa_don_xuat.cthd_xuats.build
  end

  def create
    @hoa_don_xuat = HoaDonXuat.new(hoa_don_xuat_params)
    respond_to do |format|
      if @hoa_don_xuat.save
        format.html { redirect_to @hoa_don_xuat, notice: 'Thêm hóa đơn thành công' }
        format.json { render :show, status: :created, location: admin_hoa_don_xuat_url(@hoa_don_xuat) }
      else
        format.html { render :new }
        format.json { render json: @hoa_don_xuat.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @khach_hangs = KhachHang.all
    @hang_hoas = HangHoa.all
  end

  def update
    respond_to do |format|
      if @hoa_don_xuat.update(hoa_don_xuat_params)
        format.html { redirect_to admin_hoa_don_xuats_url, notice: 'Cập nhật hóa đơn thành công!' }
        format.json { render :show, status: :ok, location: admin_hoa_don_xuat_url(@hoa_don_xuat) }
      else
        format.html { render :edit }
        format.json { render json: @hoa_don_xuat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hoa_don_xuat.destroy
    respond_to do |format|
      format.html { redirect_to admin_hoa_don_xuats_url, notice: 'Xóa thành công' }
      format.json { render json: @hoa_don_xuat.errors, status: :unprocessable_entity }
    end
  end

private

  def set_hoa_don_xuat
    @hoa_don_xuat = HoaDonXuat.find(params[:id])
  end

  def hoa_don_xuat_params
    params.require(:hoa_don_xuat).permit(:ngay_xuat, :tong_tien, :ghi_chu, :tinh_trang, :khach_hang_id, cthd_xuats_attributes: [:id, :so_luong_xuat, :hang_hoa_id, :gia_ban, :_destroy, :thanh_tien])
  end


end