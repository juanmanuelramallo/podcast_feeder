# frozen_string_literal: true

class ApplicationPresenter
  attr_reader :object

  delegate_missing_to :object
  delegate :to_param, to: :object

  def initialize(object)
    @object = object
  end
end
