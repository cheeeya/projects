# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  private    :boolean          default(TRUE)
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ApplicationRecord
  validates :user_id, :body, presence: true

  belongs_to :user
end
