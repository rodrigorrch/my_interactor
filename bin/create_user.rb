require_relative '../lib/my_interactor'

class CreateUser
  include MyInteractor

  def call
    context.fail!(error: 'an error')
  end
end

CreateUser.call(email: 'hello@world.com')

CreateUser.call(email: 'hello@world.com').failure? # => true
CreateUser.call(email: 'hello@world.com').success? # => false
