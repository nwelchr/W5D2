# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text             not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, :description, :user_id, presence: true

  belongs_to :moderator,
    class_name: :User,
    foreign_key: :user_id

  has_many :post_subs, dependent: :destroy, inverse_of: :sub

  has_many :posts,
    through: :post_subs,
    source: :post
end
