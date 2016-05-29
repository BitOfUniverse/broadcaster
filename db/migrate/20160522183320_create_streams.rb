class CreateStreams < ActiveRecord::Migration[5.0]
  def change
    create_table :streams do |t|
      t.references :user
      t.text :desc
      t.string :status
      t.string :opentok_session_id

      t.timestamps
    end
  end
end
