# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :text             not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  has_many :answers,
    class_name: 'Answer',
    foreign_key: :question_id,
    primary_key: :id

  belongs_to :polls,
    class_name: 'Poll',
    foreign_key: :poll_id,
    primary_key: :id


  has_many :responses,
    through: :answers,
    source: :responses

  def results
    # choices = self.answers.includes(:responses)
    # results = {}
    # choices.each do |choice|
    #   results[choice.answer] = choice.responses.length
    # end
    # results

    counts = self.answers.select("answers.answer, COUNT(responses.id) AS num_responses")
      .left_outer_joins(:responses).group("answers.id")

    counts.reduce({}) do |results, acc|
      results[acc.answer] = acc.num_responses; results
    end

  end

end
