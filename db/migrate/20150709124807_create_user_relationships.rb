class CreateUserRelationships < ActiveRecord::Migration
  def change
    create_table :user_relationships do |t|

      t.integer :leader_id # leader is to stalker
      t.integer :minion_id # minion is to prey

    end
  end
end
