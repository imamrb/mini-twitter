class CustomTextField < Avo::Fields::BaseField
  def initialize(name, **args, &block)
    super(name, **args, &block)
  end
end
