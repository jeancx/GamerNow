class User < ActiveRecord::Base

  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy

  after_create :set_default_role
  rolify

  include Gravtastic
  gravtastic

  devise :omniauthable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable

  has_many :users_roles
  has_many :roles, :through => :users_roles

  def self.create_from_omniauth(params)
    attributes = {
      email: params['info']['email'],
      password: Devise.friendly_token
    }
    create(attributes)
  end

  def forem_name
    self.name
  end

  private

  def set_default_role
    self.add_role :user
  end

end
