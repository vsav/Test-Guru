module TestPassagesHelper
  def test_summary(test)
    test.test_passed? ? 'passed' : 'failed'
  end
end
