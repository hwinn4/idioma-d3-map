class MapsController < ApplicationController
  # before_action :set_map, only: [:show, :edit, :update, :destroy]

  # GET /maps
  # GET /maps.json
  def index
    @maps = Map.new
  end

  # GET /maps/1
  # GET /maps/1.json
  def show
    @map = Map.new
    @state = State.all
  end

  # GET /maps/new
  def new
    @map = Map.new
  end

  # GET /maps/1/edit
  def edit
  end

  # POST /maps
  # POST /maps.json
  def create
    
  end

  # PATCH/PUT /maps/1
  # PATCH/PUT /maps/1.json
  def update
  end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params[:map]
    end
end
