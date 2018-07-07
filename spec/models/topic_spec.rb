require 'rails_helper'

RSpec.describe Topic, type: :model do
  it { should have_many(:bookmarks)}
  it { is_expected.to validate_presence_of(:title) }

  let(:topic) { create(:topic) }

    describe "attributes" do
      it "has title attributes" do
    expect(topic).to have_attributes(title: topic.title)
  end
end
