require 'rails_helper'

RSpec.describe 'Messages API', type: :request do
  describe 'POST /messages' do
    let!(:sender) do
        User.create(
                    first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    email: Faker::Internet.email
                   )
    end
    let!(:recipient) do
        User.create(
                    first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    email: Faker::Internet.email
                   )

    end
    let(:json) { JSON.parse(response.body) }
    let!(:params) { { sender_id: sender.id, recipient_id: recipient.id, text: Faker::Company.bs } }
    before { post '/api/v1/messages', params: params }

    it 'creates a new message' do
      expect(response).to have_http_status(201)
      expect(json['sender_id'].to_i).to eq(sender.id)
      expect(json['recipient_id'].to_i).to eq(recipient.id)
      expect(json['text']).to eq(params[:text])
    end
  end

  describe 'get /messages' do
    let!(:senders) do
      senders = []
      10.times do
        senders << User.create(
                     first_name: Faker::Name.first_name,
                     last_name: Faker::Name.last_name,
                     email: Faker::Internet.email
                   )
      end
      senders
    end
    let!(:recipient) do
        User.create(
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: Faker::Internet.email
        )
    end
    let!(:messages) do
      senders.map do |sender|
        Message.create(sender_id: sender.id, recipient_id: recipient.id, text: Faker::Company.bs)
      end
    end

    let(:json) { JSON.parse(response.body) }

    context 'message id and recipient id' do
      it 'returns the correct message' do
        get "/api/v1/messages?sender_id=#{senders.first.id}&recipient_id=#{recipient.id}"
        expect(response).to have_http_status(:ok)
        expect(json.length).to eq(1)
      end

      it 'returns messages for a recipient' do
        get "/api/v1/messages?recipient_id=#{recipient.id}"
        expect(response).to have_http_status(:ok)
        expect(json.length).to eq(10)
      end
    end
  end
end
