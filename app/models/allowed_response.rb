class AllowedResponse < ActiveRecord::Base
  belongs_to :question, :foreign_key => :question_id,
                        :primary_key => "id"
  has_many :responses, :foreign_key => "allowed_response_id",
                       :primary_key => :id

  has_many :responders, :through => :responses, :source => :responder

  attr_accessible :question_id, :value

  def response_count
    self.responses.length
  end

end