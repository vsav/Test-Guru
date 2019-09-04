class User < ApplicationRecord
  def show_tests(level)
    UserTest.joins(:user, :test).where(users: { id: id }, tests: { level: level })
  end
end
