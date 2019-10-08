class BadgeAwardService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @category = @test.category.title
    @user = test_passage.user
    @level = @test.level
    @badges = Badge.all
  end

  def call
    @badges.select do |badge|
      if @test_passage.test_passed?
        send(badge.condition)
      end
    end
  end

  private

  def full_tests_count(user_tests)
    user_tests.ids.group_by(&:itself).map { |_, v| v.count }.min
  end

  def badges_count(condition)
    @user.badges.where('condition = ?', condition).count
  end

  def all_in_category
    tests_count = Test.by_category(@category).count
    user_tests = @user.tests.by_category(@category)

    if tests_count == user_tests.uniq.count &&
       full_tests_count(user_tests) > badges_count(:all_in_category)
      Badge.find_by_condition('all_in_category')
    end
  end

  def all_in_level
    tests_count = Test.by_level(@level).count
    user_tests = @user.tests.by_level(@level)

    if tests_count == user_tests.uniq.count &&
       full_tests_count(user_tests) > badges_count(:all_in_level)
      Badge.find_by_condition('all_in_level')
    end
  end

  def first_attempt
    if @user.tests.where('test_id = ?', @test).count == 1
      Badge.find_by_condition('first_attempt')
    end
  end

  def first_test
    unless badges_count(:first_test).any?
      Badge.find_by_condition('first_test')
    end
  end
end
