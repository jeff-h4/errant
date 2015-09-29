require 'rails_helper'

RSpec.describe ErrandsController, type: :controller do
  render_views
  let(:json) {JSON.parse(response.body) }

  describe "GET /errands.json" do
    before do
      get :index, format: :json
    end
    context "all errands" do
      it 'responds with JSON' do
        expect {
          JSON.parse(response.body)
        }.to_not raise_error
      end
      it 'returns JSON' do
        expect(response.content_type).to eq(Mime::JSON)
      end
      it "returns the errands" do
        parsed_json = JSON.parse(response.body)
        #expect(json.collect{|e| e["title"]}).to include(@errand.title)
        expect(parsed_json).to have_key("title")
      end
    end
  end
end
