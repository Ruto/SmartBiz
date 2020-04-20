module V1
  class TransactionsController < ApplicationController
    before_action :set_transaction, only: [:show, :update, :destroy]
    before_action :authenticate_user!
    # GET /transactions
    # GET /transactions.json
    def index
      @transactions = Transaction.all
    end

    # GET /transactions/1
    # GET /transactions/1.json
    def show
    end

    # POST /transactions
    # POST /transactions.json
    def create
      @transaction = Transaction.new(transaction_params)

      if @transaction.save
        render :show, status: :created, location: @transaction
      else
        render json: @transaction.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /transactions/1
    # PATCH/PUT /transactions/1.json
    def update
      if @transaction.update(transaction_params)
        render :show, status: :ok, location: @transaction
      else
        render json: @transaction.errors, status: :unprocessable_entity
      end
    end

    # DELETE /transactions/1
    # DELETE /transactions/1.json
    def destroy
      @transaction.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_transaction
        @transaction = Transaction.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def transaction_params
        params.require(:transaction).permit(:transactionable_id, :transactionable_type, :structure_id, :type, :money_in, :money_out, :transaction_cost, :balance, :total_balance, :memo, :image_id, :account_id, :user_id, :closed)
      end
  end
end
