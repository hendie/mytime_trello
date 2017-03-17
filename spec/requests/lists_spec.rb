require 'rails_helper'

RSpec.describe 'Lists API' do
  # Initialize the test data
  let!(:board) { create(:board) }
  let!(:lists) { create_list(:list, 20, board_id: board.id) }
  let(:board_id) { board.id }
  let(:id) { lists.first.id }

  describe 'GET /boards/:board_id/lists' do
    before { get "/boards/#{board_id}/lists" }

    context 'when board exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all lists' do
        expect(json.size).to eq(20)
      end
    end

    context 'when board does not exist' do
      let(:board_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Board/)
      end
    end
  end

  describe 'GET /board/:board_id/lists/:id' do
    before { get "/boards/#{board_id}/lists/#{id}" }

    context 'when board list exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the list' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when board list does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find List/)
      end
    end
  end

  describe 'POST /boards/:boards_id/lists' do
    let(:valid_attributes) { { name: 'Write Report' } }

    context 'when request attributes are valid' do
      before { post "/boards/#{board_id}/lists", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/boards/#{board_id}/lists", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /boards/:boards_id/lists/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/boards/#{board_id}/lists/#{id}", params: valid_attributes }

    context 'when list exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the list' do
        updated_list = List.find(id)
        expect(updated_list.name).to match(/Mozart/)
      end
    end

    context 'when the list does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find List/)
      end
    end
  end

  describe 'DELETE /boards/:boards_id/lists/:id' do
    before { delete "/boards/#{board_id}/lists/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
