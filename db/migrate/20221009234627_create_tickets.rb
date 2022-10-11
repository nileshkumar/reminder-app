class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.date :due_date
      t.integer :status_id, default: 0
      t.integer :progress, default: 0

      t.timestamps
    end
  end
end
