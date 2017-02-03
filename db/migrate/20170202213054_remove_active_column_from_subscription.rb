class RemoveActiveColumnFromSubscription < ActiveRecord::Migration
  def self.up
    remove_column :subscriptions, :active
  end
  def self.down
    add_column :subscriptions, :active, :boolean, default: true
  end
end