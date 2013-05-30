class AllowedResponse < ActiveRecord::Base
  belongs_to :question, :foreign_key => :question_id,
                        :primary_key => "id"
  has_many :responses, :foreign_key => "allowed_response_id",
                       :primary_key => :id

  has_many :responders, :through => :responses, :source => :responder


end