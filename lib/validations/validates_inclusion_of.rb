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