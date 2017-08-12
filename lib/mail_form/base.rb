module MailForm
  class Base
    ######################################################################
    ##################### ACTIVE_MODEL COMPLIANT API #####################
    ######################################################################
    # Following inclusions / extentions add methods to our class so that
    # it gets ActiveModel compliant
    include ActiveModel::Conversion # implements to_model(), to_key(), to_param(), and to_partial_path()
    extend ActiveModel::Naming # implements model_name
    include ActiveModel::Validations # implements errors()
    def persisted?; false; end

    include ActiveModel::AttributeMethods  # 1) attribute methods behavior
    attribute_method_prefix "clear_"       # 2) "clear_" is attribute prefix
    attribute_method_suffix "?"

    def self.attributes *names
      attr_accessor *names
      # 3) ask to define the prefix methods for the given attribute names
      define_attribute_methods names
    end

    protected

    def clear_attribute(attribute)
      send("#{attribute}=", nil)
    end

    def attribute?(attribute)
      send(attribute).present?
    end
  end
end
