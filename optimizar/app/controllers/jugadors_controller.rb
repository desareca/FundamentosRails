class JugadorsController < ApplicationController
  before_action :set_jugador, only: %i[ show edit update destroy ]

  # GET /jugadors or /jugadors.json
  def index
    @jugadors = Jugador.all
  end

  # GET /jugadors/1 or /jugadors/1.json
  def show
  end

  # GET /jugadors/new
  def new
    @jugador = Jugador.new
  end

  # GET /jugadors/1/edit
  def edit
  end

  # POST /jugadors or /jugadors.json
  def create
    @jugador = Jugador.new(jugador_params)

    respond_to do |format|
      if @jugador.save
        format.html { redirect_to @jugador, notice: "Jugador was successfully created." }
        format.json { render :show, status: :created, location: @jugador }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jugador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jugadors/1 or /jugadors/1.json
  def update
    respond_to do |format|
      if @jugador.update(jugador_params)
        format.html { redirect_to @jugador, notice: "Jugador was successfully updated." }
        format.json { render :show, status: :ok, location: @jugador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jugador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jugadors/1 or /jugadors/1.json
  def destroy
    @jugador.destroy
    respond_to do |format|
      format.html { redirect_to jugadors_url, notice: "Jugador was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jugador
      @jugador = Jugador.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jugador_params
      params.require(:jugador).permit(:nombre, :equipo_id)
    end
end
