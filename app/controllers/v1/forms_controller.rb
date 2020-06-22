module V1
  class FormsController < ApplicationController
    before_action :set_form, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!


      def pdf_view
       @form = Form.new
        respond_to do |format|
          format.html
          format.pdf do
            pdf = FormPdf.new(@form, view_context)
            send_data pdf.render, filename: "order_#{@form.form_number}.pdf",
                                  type: "application/pdf",
                                  disposition: "inline"
          end
        end
      end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_form
        @form = Form.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def form_params
        params.require(:form).permit(:name, :alias, :type, :active, :structure_id, :user_id)
      end

  end
end
