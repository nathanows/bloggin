require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:status) }
    it { should validate_inclusion_of(:status).in_array(%w(draft published)) }
  end
end
