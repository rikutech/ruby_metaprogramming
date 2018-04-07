module CheckedAttributes
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_checked(attr)
      define_method "#{attr}=" do |value|
        raise 'Invalid attribute' unless yield(value)
        instance_variable_set("@#{attr}", value)
      end

      define_method "#{attr}" do
        instance_variable_get "@#{attr}"
      end
    end
  end
end
