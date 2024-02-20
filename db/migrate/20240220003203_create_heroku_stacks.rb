class CreateHerokuStacks < ActiveRecord::Migration[7.1]
  def change
    create_table :heroku_stacks, id: :uuid do |t|
      t.string :name, null: false
      t.uuid :heroku_identifier, null: false
      t.string :heroku_name, null: false

      t.timestamps
    end
    add_index :heroku_stacks, :name, unique: true
    add_index :heroku_stacks, :heroku_identifier, unique: true
    add_index :heroku_stacks, :heroku_name, unique: true
  end
end
