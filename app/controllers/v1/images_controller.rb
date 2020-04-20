module V1
  class ImagesController < ApplicationController
    before_action :set_image, only: [:show, :update, :destroy]
    before_action :authenticate_user!
    # GET /images
    # GET /images.json
    def index
      @images = Image.all
    end

    # GET /images/1
    # GET /images/1.json
    def show
    end

    # POST /images
    # POST /images.json
    def create
      @image = Image.new(image_params)

      if @image.save
        render :show, status: :created, location: @image
      else
        render json: @image.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /images/1
    # PATCH/PUT /images/1.json
    def update
      if @image.update(image_params)
        render :show, status: :ok, location: @image
      else
        render json: @image.errors, status: :unprocessable_entity
      end
    end

    # DELETE /images/1
    # DELETE /images/1.json
    def destroy
      @image.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_image
        @image = Image.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def image_params
        params.require(:image).permit(:name, :desc, :memo, :imageable_id, :imageable_type, :checked)
      end
  end
end
