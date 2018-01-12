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

require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:body) }
  end

  describe 'instance methods'

  describe 'class methods'

  describe 'associtions' do
    describe 'belongs to' do
      it { should belong_to(:user) }
    end
  end
end
