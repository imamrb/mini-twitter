class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :body, limit: 280
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
