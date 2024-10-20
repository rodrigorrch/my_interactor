# frozen_string_literal: true

require_relative 'my_interactor/context'
require_relative 'my_interactor/failure'

module MyInteractor
  attr_reader :context

  def self.included(mod)
    # This will declare ClassMethods#call as class method
    mod.extend ClassMethods
  end

  def initialize(...)
    @context = Context.new
    @context.assign_attributes(...)
  end

  module ClassMethods
    def call(...)
      interactor = new(...)
      interactor.call
      # Return the context to give access to the result of the interactor call.
      interactor.context
    rescue Failure
      interactor.context
    end
  end
end
