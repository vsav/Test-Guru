class User < ApplicationRecord
  def show_tests(level)
    tests = Test.where(id: JoinUserTest.where(user_id: id).pluck(:test_id))
    tests.where('level = :level', level: level).pluck(:title)
  end
end

