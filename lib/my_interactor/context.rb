require 'ostruct'

module MyInteractor
  class Context < OpenStruct
    attr_reader :failure

    def success? = !failure
    def failure? = failure
    def failure = @failure ||= false

    def fail!(**kw_args)
      # store kw_args in context (error: 'an error' for instance)
      assign_attributes(**kw_args)
      @failure = true
      raise Failure
    end

    def assign_attributes(**kw_args)
      kw_args.each { |k, v| self[k] = v }
    end
  end
end
