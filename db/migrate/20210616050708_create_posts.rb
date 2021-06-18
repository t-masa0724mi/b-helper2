class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.date    :game_day,    null: false
      t.integer :game_time_id, null: false
      t.text    :detail,  null: false

      t.timestamps
    end
  end
end
