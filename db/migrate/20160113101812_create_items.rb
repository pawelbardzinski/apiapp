class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :state
      t.references :list, index: true

      t.timestamps null: false
    end
  end
end
