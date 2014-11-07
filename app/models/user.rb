class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  NAME_FORMAT = /\A[A-Z]/

  validates :name,
            presence: true,
            format:   {with: NAME_FORMAT}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def user_initials
    name.split.map(&:first).join.upcase
  end

end
