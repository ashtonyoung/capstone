class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # Overloading built in method to omit sensitive hash data
  # Star is to accept any args from the overridden method

  # For my future reference, this is for an individual record
  def as_json(*, **kwargs)
    attributes.reject { |key, value| key.match?(/_digest/) || value.nil? } unless kwargs[:include_nil_values]
    attributes
  end
end
