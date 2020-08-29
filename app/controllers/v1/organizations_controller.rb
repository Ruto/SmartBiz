module V1
  class OrganizationsController < ApplicationController
    before_action :set_organization, only: [:show, :update, :destroy]
    before_action :authenticate_user!

    # GET /organizations
    # GET /organizations.json
    def index
      @organizations = Organization.all
    end

    # GET /organizations/1
    # GET /organizations/1.json
    def show
    end

    # POST /organizations
    # POST /organizations.json
    def create
      @organization = Organization.new(organization_params)
      @organization.user_id = @current_user.id

      if @organization.save
       @structure = Structure.create(:name => "#{@organization.name} #{@organization.category.pluralize}", :parent => get_parent, :type => "Structures::#{@organization.category}", :category => @organization.category, :user_id => @current_user.id)
       case
        when @organization.income == true
          Structure.create(:name => "#{@organization.name} Incomes", :parent => get_income_parent, :type => "Structures::Income", :structurable_id => @organization.id, :structurable_type => "Organization", :category => "Income", :structure_id => @structure.id, :user_id => @current_user.id)
        when @organization.direct_expense == true
          Structure.create(:name => "#{@organization.name} DirectExpenses", :parent => get_direct_expense_parent, :type => "Structures::DirectExpense", :category => "DirectExpense", :structure_id => @structure.id, :user_id => @current_user.id)
        when @organization.indirect_expense == true
          Structure.create(:name => "#{@organization.name} IndirectExpenses", :parent => get_indirect_expense_parent, :type => "Structures::IndirectExpense", :category => "IndirectExpense", :structure_id => @structure.id, :user_id => @current_user.id)
        when @organization.administrative_cost == true
          Structure.create(:name => "#{@organization.name} AdminstrativeCost", :parent => get_administrative_cost_parent, :type => "Structures::AdminstrativeCost", :category => "AdminstrativeCost", :structure_id => @structure.id, :user_id => @current_user.id)
        else

       end



        render :show, status: :created, location: @organization
      else
        render json: @organization.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /organizations/1
    # PATCH/PUT /organizations/1.json
    def update
      if @organization.update(organization_params)
        render :show, status: :ok, location: @organization
      else
        render json: @organization.errors, status: :unprocessable_entity
      end
    end

    # DELETE /organizations/1
    # DELETE /organizations/1.json
    def destroy
      @organization.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_organization
        @organization = Organization.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def organization_params
        params.permit(:name, :alias, :type, :category, :income, :direct_expense, :indirect_expense, :administrative_cost, :active, :user_id)
      end

      def get_parent
          if @structure.parent != nil
             @structure.parent.id
          else
            return nil
          end
      end

      def get_income_parent
          if @structure.parent != nil
            Structures::Income.find_by(:structure_id => @structure.parent.id)
          else
            return nil
          end
      end
      def get_direct_expense_parent
          if @structure.parent != nil
            Structures::DirectExpense.find_by(:structure_id => @structure.parent.id)
          else
            return nil
          end
      end
      def get_indirect_expense_parent
          if @structure.parent != nil
            Structures::IndirectExpense.find_by(:structure_id => @structure.parent.id)
          else
            return nil
          end
      end
      def get_administrative_cost_parent
          if @structure.parent != nil
            Structures::AdminstrativeCost.find_by(:structure_id => @structure.parent.id)
          else
            return nil
          end
      end

  end
end
