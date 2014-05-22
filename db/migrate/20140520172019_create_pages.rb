class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.integer :wiki_id

      t.timestamps
    end
    add_index :pages, :wiki_id
  end
end
