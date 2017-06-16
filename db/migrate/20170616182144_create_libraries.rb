class CreateLibraries < ActiveRecord::Migration[5.0]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :os_name
      t.references :ruby_gem, foreign_key: true

      t.timestamps
    end
  end
end
