class CreateSurveys < ActiveRecord::Migration
  def change
     create_table :surveys do |t|
      t.string :title, null: false
      t.string :description
      t.integer :user_id, null: false

      t.timestamp null: false
    end
  end
end
