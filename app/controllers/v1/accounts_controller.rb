module V1
  class AccountsController < ApplicationController
    before_action :set_account, only: [:show, :update, :destroy]
    before_action :authenticate_user!

    # GET /accounts
    # GET /accounts.json
    def index
      @accounts = Account.all
    end

    # GET /accounts/1
    # GET /accounts/1.json
    def show
    end

    # POST /accounts
    # POST /accounts.json
    def create
      @account = Account.new(account_params)

      if @account.save
        render :show, status: :created, location: @account
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /accounts/1
    # PATCH/PUT /accounts/1.json
    def update
      if @account.update(account_params)
        render :show, status: :ok, location: @account
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    end

    # DELETE /accounts/1
    # DELETE /accounts/1.json
    def destroy
      @account.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_account
        @account = Account.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def account_params
        params.require(:account).permit(:name, :account_type, :account_number, :desc, :active, :user_id, :fully_approved)
      end
  end
end
