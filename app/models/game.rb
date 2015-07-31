class Game < ActiveRecord::Base
	belongs_to :user

  after_create :populate_board!

  def populate_board!
    
  end
end
