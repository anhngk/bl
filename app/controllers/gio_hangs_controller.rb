class GioHangsController < ApplicationController
  before_action :set_gio_hang, only: [:edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :gio_hang_khong_ton_tai
  layout 'store'
  # GET /gio_hangs
  # GET /gio_hangs.json
  def index
    @gio_hangs = GioHang.all
  end

  # GET /gio_hangs/1
  # GET /gio_hangs/1.json
  def show
    @gio_hang = GioHang.find(params[:id])
  end

  # GET /gio_hangs/new
  def new
    @gio_hang = GioHang.new
  end

  # GET /gio_hangs/1/edit
  def edit
  end

  # POST /gio_hangs
  # POST /gio_hangs.json
  def create
    @gio_hang = GioHang.new(gio_hang_params)

    respond_to do |format|
      if @gio_hang.save
        format.html { redirect_to @gio_hang, notice: 'Gio hang was successfully created.' }
        format.json { render :show, status: :created, location: @gio_hang }
      else
        format.html { render :new }
        format.json { render json: @gio_hang.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gio_hangs/1
  # PATCH/PUT /gio_hangs/1.json
  def update
    respond_to do |format|
      if @gio_hang.update(gio_hang_params)
        format.html { redirect_to @gio_hang, notice: 'Gio hang was successfully updated.' }
        format.json { render :show, status: :ok, location: @gio_hang }
      else
        format.html { render :edit }
        format.json { render json: @gio_hang.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gio_hangs/1
  # DELETE /gio_hangs/1.json
  def destroy
    @gio_hang.destroy if @gio_hang.id == session[:gio_hang_id]
    session[:gio_hang_id] = nil
    respond_to do |format|
      format.html { redirect_to store_url, notice: 'Giỏ hàng của bạn đã trống' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gio_hang
      @gio_hang = GioHang.find(params[:id])
    end

    def gio_hang_khong_ton_tai
      logger.error "Giỏ hàng không hợp lệ #{params[:id]}"
      redirect_to store_path, notice: "Giỏ hàng không tồn tại"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gio_hang_params
      params.fetch(:gio_hang, {})
    end
end
