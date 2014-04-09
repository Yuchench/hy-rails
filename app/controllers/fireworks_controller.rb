class FireworksController < ApplicationController
  before_action :set_firework, only: [:show, :edit, :update, :destroy]

  # GET /fireworks
  # GET /fireworks.json
  def index
    @fireworks = Firework.all
  end

  # GET /fireworks/1
  # GET /fireworks/1.json
  def show
  end

  # GET /fireworks/new
  def new
    @firework = Firework.new
  end

  # GET /fireworks/1/edit
  def edit
  end

  # POST /fireworks
  # POST /fireworks.json
  def create
    @firework = Firework.new(firework_params)

    respond_to do |format|
      if @firework.save
        format.html { redirect_to @firework, notice: 'Firework was successfully created.' }
        format.json { render action: 'show', status: :created, location: @firework }
      else
        format.html { render action: 'new' }
        format.json { render json: @firework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fireworks/1
  # PATCH/PUT /fireworks/1.json
  def update
    respond_to do |format|
      if @firework.update(firework_params)
        format.html { redirect_to @firework, notice: 'Firework was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @firework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fireworks/1
  # DELETE /fireworks/1.json
  def destroy
    @firework.destroy
    respond_to do |format|
      format.html { redirect_to fireworks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_firework
      @firework = Firework.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def firework_params
      params.require(:firework).permit(:name_id, :name, :product_type, :content,:image)
    end
end
