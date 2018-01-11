# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  short_url  :string
#  long_url   :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, presence: true, uniqueness: true
  validates :user_id, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit

  has_many :visitors,
    Proc.new { distinct }, #<<<
    through: :visits,
    source: :users

  def self.random_code
    sixteen = SecureRandom.urlsafe_base64
    while self.exists?(sixteen)
      sixteen = SecureRandom.urlsafe_base64
    end
    sixteen
  end

  def self.create_short_url(user, long_url)
    if self.exists?(long_url)
      return false
    end
    ShortenedUrl.create(user_id: user.id, long_url: long_url, short_url: ShortenedUrl.random_code)
  end

  def num_clicks
    visits.length
  end

  def num_uniques
    # visits.select(:user_id).distinct.count
    visitors.count
  end

  def num_recent_uniques
    string = '"visits"."created_at"'
    visitors.where("#{string} >= ?", Time.now.ago(600)).count
  end
end
