module Forms
    class Invoice < Form
      #this sorts out routing issues for subclassing
      def self.model_name
         Form.model_name
      end

    end
end
