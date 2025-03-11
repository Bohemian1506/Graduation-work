class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      # 必須フィールド
      t.string :title, null: false
      t.datetime :event_date, null: false
      t.string :store_name, null: false

      # 任意フィールド
      t.text :location
      t.integer :capacity
      t.integer :party_fee

      # enumで管理するフィールド
      t.integer :party_type, default: 0
      t.integer :event_status, default: 0
      t.integer :visibility, default: 1  # デフォルトは非公開(private)

      # 備考・メモ
      t.text :notes

      # 外部キー
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    # 検索用インデックス
    add_index :events, :title
    add_index :events, :event_date
    add_index :events, :party_type
    add_index :events, :event_status
    add_index :events, :visibility
  end
end
