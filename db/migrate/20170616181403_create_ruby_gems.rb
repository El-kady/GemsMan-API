class CreateRubyGems < ActiveRecord::Migration[5.0]
  def change
    create_table :ruby_gems do |t|
      t.string :name
      t.string :version
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
