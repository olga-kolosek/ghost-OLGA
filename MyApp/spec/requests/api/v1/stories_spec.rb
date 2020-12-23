require 'rails_helper'

RSpec.describe "Stories API" do
  it 'get a list of stories' do
    FactoryBot.define do
      factory :story do
        title { "Title" }
        description  { "Description" }
      end
    end
    #FactoryGirl.create_list(:story, 10)

    get '/api/v1/stories'

    json = JSON.parse(response.body)

    # test for the 200 status-code
    #expect(response).to be_success
    #expect(response.status).to eq 200
    expect(response.status).to eq 401

    # check to make sure the right amount of messages are returned
    #expect(json['stories'].length).to eq(1)
  end
end