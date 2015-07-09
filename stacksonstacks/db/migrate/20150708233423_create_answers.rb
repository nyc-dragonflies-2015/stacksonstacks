class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.references :question, index: true
      t.references :user, index: true, foreign_key: true
      t.boolean :best, default: false, null: false

      t.timestamps null: false
    end
  end
end
