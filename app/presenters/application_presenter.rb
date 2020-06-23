# frozen_string_literal: true

class ApplicationPresenter
  attr_reader :object

  delegate_missing_to :object
  delegate :to_param, to: :object

  def self.all(relation)
    relation.map { |object| new(object) }
  end

  def initialize(object)
    @object = object
  end
end
