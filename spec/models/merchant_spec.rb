require 'rails_helper'

describe Merchant, type: :model do
  describe 'relationships' do
    it { should have_many(:items) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
