require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

Expectations do
  
  expect false do
    validation = Validatable::ValidatesInclusionOf.new stub_everything, :sex, :within => 'male'
    validation.valid?(stub(:sex=>"invalid"))
  end
  
  expect true do
    validation = Validatable::ValidatesInclusionOf.new stub_everything, :sex, :within => %w{male female}
    validation.valid?(stub(:sex=>"male"))
  end
  
  expect false do
    validation = Validatable::ValidatesInclusionOf.new stub_everything, :sex, :within => %w{male female}
    validation.valid?(stub(:sex=>nil))
  end
  
  expect true do
    validation = Validatable::ValidatesInclusionOf.new stub_everything, :sex, :within => %w{male female}
    validation.valid?(stub(:sex=>'male'))
  end
  
  expect true do
    validation = Validatable::ValidatesInclusionOf.new stub_everything, :sex, :within => %w{male female}
    validation.valid?(stub(:sex=>'female'))
  end
  
  expect true do
    options = {:message => nil}
    Validatable::ValidatesInclusionOf.new(stub_everything, :test).must_understand(options)
  end
  
end