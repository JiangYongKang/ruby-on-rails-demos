class User < ApplicationRecord
  belongs_to :account
  belongs_to :dept

  has_many :roles
  has_many :users_roles, through: :roles
end
