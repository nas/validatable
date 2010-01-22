# Usage:
# 
#   class Person
#     include Validatable
#     validates_inclusion_of :attribute, :within => ['value1', 'value2']
#   end
# 
module Validatable 
  class ValidatesInclusionOf < ValidationBase #:nodoc:
    option :within
    
    def valid?(instance)
      value = instance.send(self.attribute).to_s
      within.include?(value)
    end
    
    def message(instance)
      super || "is not valid"
    end
  end
end