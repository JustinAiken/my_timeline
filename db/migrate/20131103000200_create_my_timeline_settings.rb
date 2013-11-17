class CreateMyTimelineSettings < ActiveRecord::Migration

  def change
    create_table :my_timeline_settings do |t|
      t.string     :var,    :null => false
      t.text       :value
      t.references :target, :null => false, :polymorphic => true

      t.timestamps
    end

    add_index :my_timeline_settings, [ :target_type, :target_id, :var ], :unique => true
  end
end
