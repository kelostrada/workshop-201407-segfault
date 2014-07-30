class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :body,
            presence: true,
            length:   {minimum: 3}

  def author
    user.name
  end


end
