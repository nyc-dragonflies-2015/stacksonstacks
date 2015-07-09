class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :answer, index: true
      # t.references :best_answer, index: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
