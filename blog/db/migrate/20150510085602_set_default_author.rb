class SetDefaultAuthor < ActiveRecord::Migration
  def self.up
    # Now populate the category list with default data

    Author.create :name => 'root',
                  :surname => 'root',
                  :nickname => 'root',
                  :email => 'root@root.com',
                  :password => 'root',
                  :role => 'admin'

    # The "down" method takes care of the data because it
    # drops the whole table.

  end
end
