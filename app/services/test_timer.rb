# frozen_string_literal: true

class TestTimer
  def initialize(test_passage)
    @timeout = test_passage.test.timer
  end
end
