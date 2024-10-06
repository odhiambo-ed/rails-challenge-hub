class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :description
      t.string :difficulty_level
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
