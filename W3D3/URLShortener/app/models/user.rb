# == Schema Information
#
# Table name: users
#
#  id                                                              :integer          not null, primary key
#  created_at                                                      :datetime         not null
#  updated_at                                                      :datetime         not null
#  email                                                           :string
#  #<ActiveRecord::ConnectionAdapters::PostgreSQL::TableDefinition :string
#

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl

  has_many :visitations,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Visit

  has_many :visited_urls,
    Proc.new { distinct },
    through: :visitations,
    source: :shortened_urls
end
