module Structures
    class Product < Structure

        #this sorts out routing issues for subclassing
          def self.model_name
             Structure.model_name
          end

    end
end
