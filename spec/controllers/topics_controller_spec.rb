require 'rails_helper'
include RandomData
include SessionsHelper

RSpec.describe TopicsController, type: :controller do
  let(:my_topic) { create(:topic) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns Topic.all to topic" do
       get :index
       expect(assigns(:topics)).to eq([my_topic])
     end
   end

    describe "GET #show" do
      it "returns http success" do
        get :show, params: { id: my_topic.id }
        expect(response).to have_http_status(:success)
    end
      it "renders the #show view" do
          get :show, params: { id: my_topic.id }
          expect(response).to render_template :show
        end

        it "assigns my_topic to @topic" do
          get :show, params: { id: my_topic.id }
          expect(assigns(:topic)).to eq(my_topic)
        end
      end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: my_topic.id }
      expect(response).to redirect_to(new_session_path)
    end
  end

  describe "PUT update" do
      it "returns http redirect" do
        new_title = RandomData.random_sentence
        put :update, params: { id: my_topic.id, topic: { title: new_title } }
        expect(response).to redirect_to(new_session_path)
      end
    end

  describe " DELETE destroy" do
    it "deletes the topic" do
      delete :destroy, params {id: my_topic.id }
      expect(response).to redirect_to topics_path
    end
  end
end
