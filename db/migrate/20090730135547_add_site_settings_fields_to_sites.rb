class AddSiteSettingsFieldsToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :rss_message, :text
    add_column :sites, :new_user_message, :text
  end

  def self.down
    remove_column :sites, :rss_message
    remove_column :sites, :new_user_message
  end
end
