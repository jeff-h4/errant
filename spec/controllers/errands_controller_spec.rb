require 'rails_helper'

RSpec.describe ErrandsController, type: :controller do
  #render_views
  #let(:json) {JSON.parse(response.body) }

  describe "GET #create" do
    context "with valid_parameters" do
      it "created an errand in the database" do
      end
      it "assigns an owner" do
      end
      it "responds with success" do
      end
    end
    context "with invalid_parameters" do
      it "responds with error" do
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
  describe "GET #destroy" do
    it "destroys the errand" do
    end
  end
end
