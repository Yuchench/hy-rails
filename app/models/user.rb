class User < ActiveRecord::Base
  if Rails.env.production?
    devise :database_authenticatable, :rememberable, :trackable, :validatable,:registerable
  else
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable
  end
end
