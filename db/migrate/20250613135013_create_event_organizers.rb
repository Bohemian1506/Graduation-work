class CreateEventOrganizers < ActiveRecord::Migration[7.2]
  def change
    create_table :event_organizers do |t|
      t.references :event, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true # 招待時はnull許可
      t.integer :role,null: false, default: 1
      t.integer :status, null: false, default: 0
      t.string :invitation_token, null: false
      t.string :invited_email, null: false
      t.datetime :invited_at
      t.datetime :accepted_at
      t.datetime :declined_at

      t.timestamps
    end

     # インデックス追加（検索性能向上）
     add_index :event_organizers, :invitation_token, unique: true
     add_index :event_organizers, [:event_id, :user_id], unique: true, 
               where: "user_id IS NOT NULL", name: 'index_event_organizers_on_event_and_user'
     add_index :event_organizers, [:event_id, :invited_email], unique: true,
               where: "user_id IS NULL", name: 'index_event_organizers_on_event_and_email'
  end
end
