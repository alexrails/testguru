class Answer < ApplicationRecord
  belongs_to :question

  validate :validate_count_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_count_answers
    errors.add(:answers_limit, "Maximum 4 symbols") if question.answers.count > 4
  end
end
