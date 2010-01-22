require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

module Functional
  class ValidatesInclusionOfTest < Test::Unit::TestCase
    test "given the value is not present, when validated, then error is in the objects error collection" do
      klass = Class.new do
        include Validatable
        attr_accessor :sex
        validates_inclusion_of :sex, :within => ['male', 'female']
      end
      instance = klass.new
      instance.valid?
      assert_equal "is not valid", instance.errors.on(:sex)
    end
    
    test "given the value is not valid, when validated, then error is in the objects error collection" do
      klass = Class.new do
        include Validatable
        attr_accessor :sex
        validates_inclusion_of :sex, :within => ['male', 'female']
      end
      instance = klass.new
      instance.sex = 'invalid'
      instance.valid?
      assert_equal "is not valid", instance.errors.on(:sex)
    end
    
    test "given the value 'male' is present and valid, when validated, then error is in the objects error collection" do
      klass = Class.new do
        include Validatable
        attr_accessor :sex
        validates_inclusion_of :sex, :within => ['male', 'female']
      end
      instance = klass.new
      instance.sex = 'male'
      instance.valid?
      assert_equal true, instance.valid?
    end
    
    test "given the value 'female' is present and valid, when validated, then error is in the objects error collection" do
      klass = Class.new do
        include Validatable
        attr_accessor :sex
        validates_inclusion_of :sex, :within => ['male', 'female']
      end
      instance = klass.new
      instance.sex = 'female'
      instance.valid?
      assert_equal true, instance.valid?
    end
  end
end