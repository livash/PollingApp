class User < ActiveRecord::Base
  validates :name, :length => {:minimum => 2}
  validates :email, :format =
                  { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/}
  validates :email, :uniqueness => true

  has_many :polls, :foreign_key => :creator_id, :primary_key => :id
  has_many :responses, :foreign_key => :responder_id, :primary_key => :id
  has_many :questions, :through => :polls, :source => :questions
end