class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # Overloading built in method to omit sensitive hash data
  # Star is to accept any args from the overriden method
  def as_json(*, **kwargs)
    return attributes.reject { |key, _| key.match?(/_digest/) } if kwargs[:include_nil_values]

    attributes.reject { |key, value| key.match?(/_digest/) || value.nil? }
  end
end
