# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  content           :text             not null
#  author_id         :integer          not null
#  post_id           :integer          not null
#  parent_comment_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: 'User'

  belongs_to :parent_comment,
    primary_key: :id,
    foreign_key: :parent_comment_id,
    class_name: 'Comment',
    optional: true

  belongs_to :post
end
