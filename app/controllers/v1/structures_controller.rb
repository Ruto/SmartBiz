module V1
  class StructuresController < ApplicationController
    before_action :set_structure, only: [:show, :edit, :update, :destroy]
  #  before_action :authenticate_user!

    # GET /structures
    # GET /structures.json
    def index
      @structures = Structure.all
      #@structures = Structure.arrange_serializable
      #render json: @structures
      render :index, status: :ok, locals: { structures: @structures  }
    end

    # GET /structures/1
    # GET /structures/1.json
    def show
    end

  #  def sub_structure(structure_id)
  #      @structures = Structure.find_by_id
  #  end

    # GET /structures/new
    def new
      @structure = Structure.new(:parent_id => params[:parent_id])
      #binding.pry
      if params[:parent_id].present?
        @category = Structure.find(params[:parent_id])
      else
        @category = nil
      end

    end

    # GET /structures/1/edit
    def edit
    end

    def create_unit_group
      @structure = Structure.new(structure_params)
    # @structure.
    end

    def link_unit_groups

    end

    # POST /structures
    # POST /structures.json
    def create
      @structure = Structure.new(structure_params)
    #  @structure.user_id = @current_user.id    ## this is when users is added.
      @structure.structurable_id = params[:parent_id]
      @structure.structurable_type = "Structure"


        #binding.pry
        if @structure.save
          # @structure.update(:structure_id => @structure.id)
          @category_array = ["Holding_Company", "Company", "Department", "Sub_Department" ]
          @products_services_array = ["Product", "Service", "ProductGroup", "ServiceGroup"]

          if @category_array.include? @structure.category
              totals_array = ["Income", "DirectExpense", "IndirectExpense", "AdminstrativeCost"]
              totals_array.each do |total|
                Structure.create(:name => "#{@structure.name} #{total.pluralize}", :parent => get_parent(total), :type => "Structures::#{total}", :category => total, :structure_id => @structure.id, :structurable_id => @structure.id, :structurable_type => "Structure", :user_id => @structure.user_id)
              end
          elsif  @products_services_array.include? @structure.category
              products_array = ["Income", "Expense"]
              products_array.each do |product|
                Structure.create(:name => "#{@structure.name} #{product}", :type => "Structures::#{product}", :category => product, :structure_id => @structure.id, :structurable_id => @structure.id, :structurable_type => "Structure", :user_id => @structure.user_id)
              end
          else

          end

           #render json: status: :created, location: @structure
           render :create, status: :created, locals: { structure: @structure  }
        else
           render json: @structure.errors, status: :unprocessable_entity
        end

    end

    # PATCH/PUT /structures/1
    # PATCH/PUT /structures/1.json
    def update
      respond_to do |format|
        if @structure.update(structure_params)
          format.html { redirect_to @structure, notice: 'Structure was successfully updated.' }
          format.json { render :show, status: :ok, location: @structure }
        else
          format.html { render :edit }
          format.json { render json: @structure.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /structures/1
    # DELETE /structures/1.json
    def destroy
      @structure.destroy
      Structure.where(:structure_id => @structure.id).each do |structure|
        structure.destroy
      end
      respond_to do |format|
        format.html { redirect_to structures_url, notice: 'Structure was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_structure
        @structure = Structure.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def structure_params
        #params.require(:structure).permit(:name, :alias, :type, :parent_id, :category, :active, :user_id, :structure_id, :structure_id, :structurable_id, :structurable_type)
        params.permit(:name, :alias, :type, :parent_id, :category, :active, :user_id, :structure_id, :structurable_id, :structurable_type)

      end

      def get_parent(total)
          if @structure.parent != nil and @category_array.include? @structure.category
            "Structures::#{total}".classify.constantize.find_by(:structure_id => @structure.parent.id)
          elsif @structure.parent != nil and @products_services_array.include? @structure.category
            "Structures::#{total}".classify.constantize.find_by(:structure_id => @structure.parent.id)
          else
            return nil
          end
      end

      def get_unit_parent(unit)
         Structures.find_by_id(unit)
      end

  end
end
