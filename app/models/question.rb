class Question < ActiveRecord::Base


  belongs_to :poll, :foreign_key => :poll_id, :primary_key => :id
    has_many :allowed_responses, :foreign_key => :question_id,
                                :primary_key => :id
  has_many :responses, :through => :allowed_responses, :source => :responses
  has_many :responders, :through => :responses, :source => :responder

  attr_accessible :poll_id, :body

  def add_allowed_response(options = {})
    default = {
      :question_id => self.id,
    }
    options = default.merge(options)
    AllowedResponse.new(options).save!
  end

  def remove_allowed_response(response_id)
    AllowedResponse.find_by_id(response_id).destroy
  end

  def list_allowed_responses
    self.allowed_responses.each do |response|
      puts "#{response.id}  #{response.value}"
    end
  end

  def response_count
    #XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    #look up how ot do it with a join
    allowed_responses = self.allowed_responses.includes(:responses)


    allowed_responses.each do |response|
      puts "#{response.value}  #{response.response_count}  #{self.body}"
    end
  end

end