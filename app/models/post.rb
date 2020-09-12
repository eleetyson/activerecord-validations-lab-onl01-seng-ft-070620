class Post < ActiveRecord::Base
  # all posts have a title
  # content is min 250 chars
  # summary is max 250 chars
  # category is either "Fiction" or "Non-Fiction"
  # custom validation for clickbaity title
  include ActiveModel::Validations
  validates :title, presence: true
  validate :title_is_clickbait
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

# add to the errors collection if title isn't clickbait
  def title_is_clickbait
    if title
      unless title.match?(/Won't Believe | Secret | Guess | Top \d+/)
        errors.add(:title, "need a more clickbaity title")
      end
    end
  end

end
