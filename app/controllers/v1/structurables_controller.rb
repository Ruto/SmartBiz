module V1
  class StructurablesController < ApplicationController
    before_action :set_structurable, only: [:show, :update, :destroy]
    before_action :authenticate_user!

    # GET /structurables
    # GET /structurables.json
    def index
      @structurables = Structurable.all
    end

    # GET /structurables/1
    # GET /structurables/1.json
    def show
    end

    # POST /structurables
    # POST /structurables.json
    def create
      @structurable = Structurable.new(structurable_params)

      if @structurable.save
        render :show, status: :created, location: @structurable
      else
        render json: @structurable.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /structurables/1
    # PATCH/PUT /structurables/1.json
    def update
      if @structurable.update(structurable_params)
        render :show, status: :ok, location: @structurable
      else
        render json: @structurable.errors, status: :unprocessable_entity
      end
    end

    # DELETE /structurables/1
    # DELETE /structurables/1.json
    def destroy
      @structurable.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_structurable
        @structurable = Structurable.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def structurable_params
        params.require(:structurable).permit(:structure_id, :structured_id, :cost_code, :active, :user_id)
      end
  end
end
