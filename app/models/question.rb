class Question < ActiveRecord::Base

  belongs_to :user

  validates :body,
            presence: true,
            length:   {minimum: 3}

  def author
    user.name
  end

end
