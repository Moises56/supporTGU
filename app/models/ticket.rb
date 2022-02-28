class Ticket < ApplicationRecord
    # has_rich_text :mensaje
    belongs_to :user 


    resourcify

  has_many :users, through: :roles, class_name: 'User', source: :users
  has_many :creators, -> { where(roles: {name: :creator}) }, through: :roles, class_name: 'User', source: :users
  has_many :editors, -> { where(roles: {name: :editor}) }, through: :roles, class_name: 'User', source: :users


    def can_show_started?
        self.state.eql?("In Progress") || self.state.eql?("Completed")
    end

    def can_show_completed?
        self.state.eql?("Completed")
    end



end
