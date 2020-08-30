module Products
    class Service < Product
      #this sorts out routing issues for subclassing
      def self.model_name
        Product.model_name
      end

    end
end
