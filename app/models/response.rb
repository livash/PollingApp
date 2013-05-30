class Response < ActiveRecord::Base
  belongs_to :responder, :class_name => "User", :foreign_key => :responder_id,
                        :primary_key => "id"
  belongs_to :allowed_response, :foreign_key => :allowed_response_id,
                                :primary_key => :id,
                                :class_name => "AllowedResponse"

end