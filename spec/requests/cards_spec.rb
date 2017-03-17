require 'rails_helper'

RSpec.describe 'Cards API' do
  # Initialize the test data
  let!(:board) { create(:board) }
  let!(:list) { create(:list, board_id: board.id) }
  let!(:move_list) { create(:list, board_id: board.id) }
  let!(:cards) { create_list(:card, 20, list_id: list.id) }
  let(:board_id) { board.id }
  let(:list_id) { list.id }
  let(:move_id) { move_list.id }
  let(:id) { cards.first.id }

  describe 'GET /boards/:board_id/lists/:list_id/cards' do
    before { get "/boards/#{board_id}/lists/#{list_id}/cards" }

    context 'when list exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all list cards' do
        expect(json.size).to eq(20)
      end
    end

    context 'when list does not exist' do
      let(:list_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find List/)
      end
    end
  end

  describe 'GET /board/:board_id/lists/:list_id/cards/:id' do
    before { get "/boards/#{board_id}/lists/#{list_id}/cards/#{id}" }

    context 'when list card exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the card' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when list card does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Card/)
      end
    end
  end

  describe 'POST /boards/:boards_id/lists/:list_id/cards' do
    let(:valid_attributes) { { title: 'Write Report' } }

    context 'when request attributes are valid' do
      before { post "/boards/#{board_id}/lists/#{list_id}/cards", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/boards/#{board_id}/lists/#{list_id}/cards", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  describe 'PUT /boards/:boards_id/lists/:list_id/cards/:id' do
    let(:valid_attributes) { { title: 'Mozart' } }

    before { put "/boards/#{board_id}/lists/#{list_id}/cards/#{id}", params: valid_attributes }

    context 'when card exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the card' do
        updated_card = Card.find(id)
        expect(updated_card.title).to match(/Mozart/)
      end
    end

    context 'when the card does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Card/)
      end
    end
  end

  describe 'PATCH /boards/:boards_id/lists/:list_id/cards/:id/move/:move_id' do
    before { patch "/boards/#{board_id}/lists/#{list_id}/cards/#{id}/move/#{move_id}" }

    context 'when card exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the card' do
        updated_card = Card.find(id)
        expect(updated_card.list).to eq(move_list)
      end
    end

    context 'when the card does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Card/)
      end
    end

    context 'when the new list does not exist' do
      let(:move_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find List/)
      end
    end
  end

  describe 'DELETE /boards/:boards_id/lists/:list_id/cards/:id' do
    before { delete "/boards/#{board_id}/lists/#{list_id}/cards/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
