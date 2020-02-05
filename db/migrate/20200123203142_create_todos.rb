class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :name #limited to 255 chars
      t.text :description
    end
  end
end
