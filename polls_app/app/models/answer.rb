# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer          not null
#  answer      :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ApplicationRecord
  belongs_to :question,
    class_name: 'Question',
    foreign_key: :question_id,
    primary_key: :id

  has_many :responses,
    class_name: 'Response',
    foreign_key: :answer_id,
    primary_key: :id

end
