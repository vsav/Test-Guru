class User < ApplicationRecord
  def show_tests(level)
    Test.joins('JOIN user_tests ON tests.id = user_tests.test_id')
        .where('user_tests.user_id = ? AND level = ?', id, level)
  end
end
