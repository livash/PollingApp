class User < ActiveRecord::Base
  validates :name, :length => {:minimum => 2}
  validates :email, :format =>
                  { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/}
  validates :email, :uniqueness => true

  has_many :polls, :foreign_key => :creator_id, :primary_key => :id
  has_many :responses, :foreign_key => :responder_id, :primary_key => :id
  has_many :questions, :through => :polls, :source => :questions

  attr_accessible :name, :email

  def create_poll(options = {})
    default = {
      :name => "#{self.name}'s poll",
      :creator_id => self.id
    }
    options = default.merge(options)

    poll = Poll.new(options).save!
  end

  def list_all_questions
    self.questions.each do |question|
      puts "#{question.poll_id}. #{question.id}.   #{question.body}"
    end
  end

  def list_polls
    self.polls.each do |poll|
      puts "#{poll.id}  #{poll.name}"
    end
  end

  def list_poll_questions(poll_id)
    Poll.find_by_id(poll_id).questions
  end

  def submit_response(allowed_response_id)
    Response.new({:allowed_response_id => allowed_response_id,
      :responder_id => self.id}).save!
  end


end