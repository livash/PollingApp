class Response < ActiveRecord::Base
  validate :responder_has_already_answered, :creator_is_responder

  has_one :question, :through => :allowed_response, 0
  belongs_to :responder, :class_name => "User", :foreign_key => :responder_id,
  :primary_key => "id"
  belongs_to :allowed_response, :foreign_key => :allowed_response_id,
  :primary_key => :id,
  :class_name => "AllowedResponse"

  attr_accessible :allowed_response_id, :responder_id

  def creator_is_responder
    question = self.question
    poll = question.poll
    if poll.creator_id == self.responder_id
      errors[:responder_id] << "The creator of the poll cannot answer the questions."
    end
  end

  def responder_has_already_answered
    responder = User.find_by_id(self.responder_id)
    #TODO where() so we look only for responders with this doods id
    #lookup the exists method.
    if question.responders.include?(responder)
      errors[:responder_id] << "Responder has already answered the question."
    end
  end


end