require 'rails_helper'
include RandomData
include SessionsHelper


RSpec.describe BookmarksController, type: :controller do

  let(:my_topic) { create(:topic) }
  let(:my_user) { create(:user) }
  let(:my_bookmark) { create(:bookmark, topic: my_topic, user: my_user) }


  describe "GET #show" do
    it "returns http success" do
      get :show, params: { topic_id: my_topic.id, id: my_bookmark.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: { topic_id: my_topic.id }
      expect(response).to redirect_to(new_session_path)
    end
  end

  describe "POST create" do
       it "returns http redirect" do
         post :create, params: { topic_id: my_topic.id, bookmark: { url: RandomData.random_sentence } }
         expect(response).to redirect_to(new_session_path)
       end
     end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { topic_id: my_topic.id, id: my_bookmark.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE destroy" do
        it "returns http redirect" do
          delete :destroy, params: { topic_id: my_topic.id, id: my_bookmark.id }
          expect(response).to redirect_to(new_session_path)
        end
    end
end
