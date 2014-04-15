class Admin::SlidesController < ApplicationController
  layout 'admin'
  http_basic_authenticate_with :name => "test", :password => "test"
  before_action :set_slide, only: [:show, :edit, :update, :destroy]
  def index
    @page_title = "Slides"
    @slides = Slide.all
  end
  def new
    @slide = Slide.new
  end
  def create
    @slide = Slide.new(slide_params)

    respond_to do |format|
      if @slide.save
        format.html { redirect_to [:admin,@slide], notice: 'Slide was successfully created.' }
        format.json { render action: 'show', status: :created, location: @slide }
      else
        format.html { render action: 'new' }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
  end
  def destroy
    @slide.destroy
    respond_to do |format|
      format.html { redirect_to admin_slides_url }
      format.json { head :no_content }
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_slide
    @slide = Slide.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def slide_params
    params.require(:slide).permit(:caption, :image,:slideimage)
  end
end
