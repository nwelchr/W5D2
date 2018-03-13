# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

  validates :title, :author, presence: true

  belongs_to :author,
    class_name: :User,
    foreign_key: :user_id

  has_many :post_subs, dependent: :destroy, inverse_of: :post

  has_many :subs,
    through: :post_subs,
    source: :sub

  has_many :comments

  def top_level_comments
    self.comments.where(parent_comment_id: nil)
  end
end
