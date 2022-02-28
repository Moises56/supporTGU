class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable, :lockable, :trackable


  has_many :tickets

  has_many :tickets, through: :roles, source: :resource, source_type: :Ticket
  has_many :creator_tickets, -> { where(roles: {name: :creator}) }, through: :roles, source: :resource, source_type: :Ticket
  has_many :editor_tickets, -> { where(roles: {name: :editor}) }, through: :roles, source: :resource, source_type: :Ticket

  def self.buscador(termino)
    User.where("email  LIKE ?", "%#{termino}%")
  end


  # Roles de usuarios
  after_create :assign_default_role

  validate :must_have_a_role, on: :update

  private

  def must_have_a_role
    unless roles.any?
      errors.add(:roles, "must have at least 1 role")
    end
  end


  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end



end

