class CreateSteps < ActiveRecord::Migration
  def self.up
    create_table :steps do |t|
      t.integer :assignment_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :steps
  end
end
