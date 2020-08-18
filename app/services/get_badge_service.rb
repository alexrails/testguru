class GetBadgeService

  def initialize(user_passed_test)
    @user = user_passed_test.user
    @test = user_passed_test.test
    @user_passed_test = user_passed_test
  end

  def call
    Badge.select do |badge|
      rule = "#{badge.rule}?"
      send(rule)
    end
  end

  private

  def category_complete?
    category = Category.find_by(title: @test.category.title)

    category == @test.category && Test.where(category: category).count == completed_category(@user, category)
  end

  def first_try?
    @user_passed_test.done? && @user.tests.where(id: @test.id).count = 1
  end

  def level_complete?
    test = Test.find_by(level: @test.level)

    test.level == @test.level && Test.where(level: @test.level).count == completed_level(@user, @test.level)
  end

  def completed_category(user, category)
    user.user_passed_tests.by_category(category).group(:test).count.keys.size
  end

  def completed_level(user, level)
    user.user_passed_tests.by_level(level).group(:test).count.keys.size
  end
end
