class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      # That's probably not nullable...
      t.string :name

      t.timestamps null: false
    end
  end
end
