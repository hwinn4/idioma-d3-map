class neighborhoodsController < ApplicationController
  before_action :set_neighborhood, only: [:show, :edit, :update, :destroy]

  # GET /neighborhoods
  # GET /neighborhoods.json
  def index
    @neighborhoods = neighborhood.all
  end

  # GET /neighborhoods/1
  # GET /neighborhoods/1.json
  def show
  end

  # GET /neighborhoods/new
  def new
    @neighborhood = neighborhood.new
  end

  # GET /neighborhoods/1/edit
  def edit
  end

  # POST /neighborhoods
  # POST /neighborhoods.json
  def create
    @neighborhood = neighborhood.new(neighborhood_params)

    respond_to do |format|
      if @neighborhood.save
        format.html { redirect_to @neighborhood, notice: 'neighborhood was successfully created.' }
        format.json { render :show, status: :created, location: @neighborhood }
      else
        format.html { render :new }
        format.json { render json: @neighborhood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /neighborhoods/1
  # PATCH/PUT /neighborhoods/1.json
  def update
    respond_to do |format|
      if @neighborhood.update(neighborhood_params)
        format.html { redirect_to @neighborhood, notice: 'neighborhood was successfully updated.' }
        format.json { render :show, status: :ok, location: @neighborhood }
      else
        format.html { render :edit }
        format.json { render json: @neighborhood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /neighborhoods/1
  # DELETE /neighborhoods/1.json
  def destroy
    @neighborhood.destroy
    respond_to do |format|
      format.html { redirect_to neighborhoods_url, notice: 'neighborhood was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_neighborhood
      @neighborhood = neighborhood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def neighborhood_params
      params[:neighborhood]
    end
end
