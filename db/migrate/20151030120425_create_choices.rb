class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :selection, null: false
      t.integer :question_id, null: false
      t.integer :count, default: 0

      t.timestamp null: false
    end
  end
end
