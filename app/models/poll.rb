class Poll < ActiveRecord::Base
  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id",
            :primary_key => "id"
  has_many :questions, :foreign_key => "poll_id", :primary_key => :id
  has_many :responses, :through => :questions, :source => :responses
  has_many :responders, :through => :responses, :source => :responder

  attr_accessible :creator_id, :name

  def add_question(options = {})
    default = {
      :poll_id => self.id
    }
    options = default.merge(options)

    Question.new(options).save!
  end

  def delete_question(question_id)
    Question.find_by_id(question_id).destroy
  end

  def responder_count
  #   query = # <<-SQL
 # #    SELECT questions.poll_id, rcounts
 # #    FROM questions
 # #    JOIN
 # #    (SELECT allowed_responses.*, COUNT(responder_id) as rcounts
 # #    FROM allowed_responses
 # #    JOIN responses
 # #    ON allowed_responses.id = responses.allowed_response_id
 # #    GROUP BY allowed_responses.id) as r
 # #    ON r.question_id = questions.id
 # #    GROUP BY questions.poll_id
 # #    SQL
    self.questions
        .joins(:allowed_responses => :responses)
        .count("DISTINCT(responses.responder_id)")
  end

end