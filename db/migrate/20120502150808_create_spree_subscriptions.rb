class CreateSpreeSubscriptions < ActiveRecord::Migration
  def change
    create_table :spree_subscriptions do |t|
      t.references :variant
      t.references :user
      t.date :start_date
      t.date :end_date
      t.string :state
      t.timestamps
    end
  end
end