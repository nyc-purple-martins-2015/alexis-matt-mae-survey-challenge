class CreateUserResponses < ActiveRecord::Migration
  def change
    create_table :user_responses do |t|
      t.integer :choice_id, null: false
      t.integer :user_id, null: false
      t.integer :survey_id, null: false

      t.timestamp null: false
    end
  end
end
