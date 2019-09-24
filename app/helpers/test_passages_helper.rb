module TestPassagesHelper
  def test_summary_message(test)
    if test.test_passed?
      t('.success_message')
    else
      t('.failed_message')
    end
  end

  def test_summary_score_color(test)
    if test.test_passed?
      'passed'
    else
      'failed'
    end
  end
end
