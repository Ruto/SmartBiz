module V1
  class CodesController < ApplicationController
    before_action :set_code, only: [:show, :update, :destroy]

    # GET /codes
    # GET /codes.json
    def index
      @codes = Code.all
    end

    # GET /codes/1
    # GET /codes/1.json
    def show
    end

    # POST /codes
    # POST /codes.json
    def create
      @code = Code.new(code_params)

      if @code.save
        render :show, status: :created, location: @code
      else
        render json: @code.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /codes/1
    # PATCH/PUT /codes/1.json
    def update
      if @code.update(code_params)
        render :show, status: :ok, location: @code
      else
        render json: @code.errors, status: :unprocessable_entity
      end
    end

    # DELETE /codes/1
    # DELETE /codes/1.json
    def destroy
      @code.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_code
        @code = Code.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def code_params
        params.require(:code).permit(:cost_code, :system_code, :codable_id, :codable_type, :active, :user_id)
      end
  end
end
