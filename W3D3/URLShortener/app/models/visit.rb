# == Schema Information
#
# Table name: visits
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  short_url_id :integer
#

class Visit < ApplicationRecord
  validates :short_url_id, :user_id, presence: true

    belongs_to :shortened_urls,
      primary_key: :id,
      foreign_key: :short_url_id,
      class_name: :ShortenedUrl

    belongs_to :users,
      primary_key: :id,
      foreign_key: :user_id,
      class_name: :User

    def self.record_visit!(user, shortened_url)
      Visit.create(user_id: user.id, short_url_id: shortened_url.id)
    end


end
