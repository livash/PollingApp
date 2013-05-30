class Question < ActiveRecord::Base
  belongs_to :poll, :foreign_key => :poll_id, :primary_key => :id
    has_many :allowed_responses, :foreign_key => :question_id,
                                :primary_key => :id
  has_many :responses, :through => :allowed_responses, :source => :responses
  has_many :responders, :through => :responses, :source => :responder
end