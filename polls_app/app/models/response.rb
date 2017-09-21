# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  answer_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Response < ApplicationRecord
  validate :response_from_author

  belongs_to :answer,
    class_name: 'Answer',
    foreign_key: :answer_id,
    primary_key: :id

  belongs_to :respondent,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id

  has_one :question,
    through: :answer,
    source: :question


  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    self.sibling_responses.where('responses.user_id = ?', self.user_id).exists?
  end

  def response_from_author
    if self.question.polls.author.id == self.user_id
      errors[:author_response] << 'Author cannot respond to their own polls'
    end
  end

end
