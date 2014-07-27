class Question < ActiveRecord::Base
  AUTHOR_FORMAT = /\A[A-Z][A-Za-z]+\z/

  validates :body,
            presence: true,
            length:   {minimum: 3}

  validates :author,
            presence: true,
            format:   {with: AUTHOR_FORMAT}

  def author_initials
    author.split.map(&:first).join.upcase
  end

end
