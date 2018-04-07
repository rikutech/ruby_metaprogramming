  def add_checked_attribute(klass, attribute)
    eval "
    class #{klass}
      def #{attribute}
        @#{attribute}
      end

      def #{attribute}=(attr)
        raise RuntimeError unless attr
        @#{attribute} = attr
      end
    end
    "
  end
