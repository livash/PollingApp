class Poll < ActiveRecord::Base
  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id",
            :primary_key => "id"
  has_many :questions, :foreign_key => "poll_id", :primary_key => :id


end