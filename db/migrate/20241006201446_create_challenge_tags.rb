class CreateChallengeTags < ActiveRecord::Migration[7.0]
  def change
    create_table :challenge_tags do |t|
      t.references :challenge, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
