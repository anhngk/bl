class ChiTietGioHangsController < ApplicationController
  include GioHangHienTai

  before_action :set_gio_hang, only: [:create, :edit, :update]
  before_action :set_chi_tiet_gio_hang, only: [:show, :edit, :update, :destroy]

  # GET /chi_tiet_gio_hangs
  # GET /chi_tiet_gio_hangs.json
  def index
    @chi_tiet_gio_hangs = ChiTietGioHang.all
  end

  # GET /chi_tiet_gio_hangs/1
  # GET /chi_tiet_gio_hangs/1.json
  def show
  end

  # GET /chi_tiet_gio_hangs/new
  def new
    @chi_tiet_gio_hang = ChiTietGioHang.new
  end

  # GET /chi_tiet_gio_hangs/1/edit
  def edit
    hang_hoa = HangHoa.find(params[:hang_hoa_id])
    so_luong = params[:so_luong]
    @gia = Gia.find(params[:hang_hoa_id])
    @chi_tiet_gio_hang = @gio_hang.them_hang_hoa(hang_hoa.id, so_luong)
  end

  # POST /chi_tiet_gio_hangs
  # POST /chi_tiet_gio_hangs.json
  def create
    hang_hoa = HangHoa.find(params[:hang_hoa_id])
    so_luong = params[:so_luong]
    @gia = Gia.find(params[:hang_hoa_id])
    @chi_tiet_gio_hang = @gio_hang.them_hang_hoa(hang_hoa.id, so_luong)

    respond_to do |format|
      if @chi_tiet_gio_hang.save
        format.html { redirect_to @chi_tiet_gio_hang.gio_hang, notice: 'Thêm vào giỏ hàng thành công' }
        format.json { render :show, status: :created, location: @chi_tiet_gio_hang }
      else
        format.html { render :new }
        format.json { render json: @chi_tiet_gio_hang.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chi_tiet_gio_hangs/1
  # PATCH/PUT /chi_tiet_gio_hangs/1.json
  def update
    chi_tiet = ChiTietGioHang.find(params[:id])
    respond_to do |format|
      if @chi_tiet_gio_hang.update(update_chi_tiet_gio_hang_params)
        format.html { redirect_to :back, notice: 'Giỏ hàng đã được cập nhật' }
        format.json { render :show, status: :ok, location: @chi_tiet_gio_hang }
      else
        format.html { render :edit }
        format.json { render json: @chi_tiet_gio_hang.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chi_tiet_gio_hangs/1
  # DELETE /chi_tiet_gio_hangs/1.json
  def destroy

    @chi_tiet_gio_hang.destroy
    respond_to do |format|
      format.html { redirect_to gio_hang_path(set_gio_hang), notice: 'Hàng hóa đã được xóa khỏi giỏ hàng' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chi_tiet_gio_hang
      @chi_tiet_gio_hang = ChiTietGioHang.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chi_tiet_gio_hang_params
      params.require(:chi_tiet_gio_hang).permit(:hang_hoa_id, :so_luong)
    end

    def update_chi_tiet_gio_hang_params
      params.require(:chi_tiet_gio_hang).permit(:so_luong)
    end
end
