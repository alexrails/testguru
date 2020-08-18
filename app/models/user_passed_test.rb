class UserPassedTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  scope :by_level, ->(level) { joins(:test).where(tests: { level: level }) }
  scope :by_category, ->(category) { joins(:test).where(tests: { category: category }) }

  DONE_PERCENT = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question
    save!
  end

  def result
    100 * self.correct_questions / test.questions.count
  end

  def success?
    result >= DONE_PERCENT
  end

  def current_question_number
    test.questions.count - test.questions.order(:id).where('id > ?', current_question.id).count
  end

  def done?
    completed? && success?
  end

  private

  def before_validation_set_first_question
    if test.present?
      self.current_question = test.questions.first
    else
      self.current_question = next_question
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
