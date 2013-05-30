class CreateUsersPollsQuestionsAllowedResponsesResponsesTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :email, :null => false
    end

    create_table :polls do |t|
      t.integer :creator_id, :null => false
    end

    create_table :questions do |t|
      t.integer :poll_id, :null => false
      t.text :body, :null => false
    end

    create_table :allowed_responses do |t|
      t.integer :question_id, :null => false
      t.string :value, :null => false
    end

    create_table :responses do |t|
      t.integer :allowed_response_id, :null => false
      t.integer :responder_id, :null => false
    end

  end
end
