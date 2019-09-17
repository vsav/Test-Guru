module TestPassagesHelper
  def test_summary(test)
    if test.test_passed?
      @message = "You have passed the test"
      @result = 'passed'
    else
      @message = "You have failed the test"
      @result = 'failed'
    end
  end
end
