class CreatePlayersTable < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :job
      t.integer :health
      t.integer :magic

      t.timestamps
    end
  end
end
