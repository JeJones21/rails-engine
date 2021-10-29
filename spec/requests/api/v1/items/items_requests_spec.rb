require 'rails_helper'

RSpec.describe 'Items endpoint' do

  it 'returns 20 items' do
      create_list(:item, 22)

      get '/api/v1/items', params: { page: 2 }

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items[:data].count).to eq(2)
  end
end
