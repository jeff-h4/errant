require 'rails_helper'

RSpec.describe ErrandsController, type: :controller do
  #render_views
  #let(:json) {JSON.parse(response.body) }

  describe "POST #create" do
    context "with valid_parameters" do
      def valid_attributes(new_attributes={})
        attributes_for(:errand).merge(new_attributes)
      end
      def user_valid_attributes(new_attributes={})
        attributes_for(:user).merge(new_attributes)
      end
      it "created an errand in the database" do
        valid_params = valid_attributes
        # This is not necessary since the Controller will only respond with JSOn.
        # If the controller could respond with either HTML or JSON, then we need to specify
        # the header
        #request_headers = {
        #  "Accept" => "application/json",
        #  "Content-Type" => "application/json"
        #}
        # POST function takes params in the form of a HASH
        # The Rails controller is smart enough to take the HASH and process it
        post :create, {errand: valid_params}
        parsed_json = JSON.parse(response.body)
        expect(parsed_json["result"]).to eq("success")
      end
      let(:user) {create(:user)}
      # Stubs out this method. somehow.
      before {allow(controller).to receive(:current_user) { user } }
      it "assigns an owner" do
        valid_params = valid_attributes
        post :create, {errand: valid_params}
        expect(Errand.last.owner).to eq(user)
      end
      it "responds with success" do
        valid_params = valid_attributes
        post :create, {errand: valid_params}
        parsed_json = JSON.parse(response.body)
        expect(parsed_json["result"]).to eq("success")
      end
    end
    context "with invalid_parameters" do
      def invalid_attributes(new_attributes={})
        attributes_for(:errand).merge(new_attributes)
      end
      it "responds with error" do
        invalid_params = invalid_attributes(title: nil)
        post :create, {errand: invalid_params}
        parsed_json = JSON.parse(response.body)
        expect(parsed_json["result"]).to eq("error")
      end
    end
  end
  describe "GET #index /errands.json" do
    context "all errands" do
      before do
        seed_errands
        get :index, format: :json
      end
      NUM_SEEDS = 5
      def seed_errands
        NUM_SEEDS.times do
          create(:errand)
        end
      end
      it 'responds with JSON' do
        expect {
          JSON.parse(response.body)
        }.to_not raise_error
      end
      it 'responds with success' do
        expect(response).to be_success
      end
      it 'returns JSON' do
        expect(response.content_type).to eq(Mime::JSON)
      end
      it "returns a list of errands" do
        parsed_json = JSON.parse(response.body)
        #expect(json.collect{|e| e["title"]}).to include(@errand.title)
        expect(parsed_json.length).to eq(NUM_SEEDS);
      end
    end
  end
  describe "GET #update" do
    context "valid parameters passed in" do
    end
    context "invalid parameters passed in" do
    end
  end
  describe "DELETE #destroy" do
    it "destroys the errand" do
      create(:errand)
      delete :destroy, 
    end
  end
end
