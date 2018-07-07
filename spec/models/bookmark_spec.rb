require 'rails_helper'

RSpec.describe Bookmark, type: :model do


  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:bookmark) { create(:bookmark) }

  let(:bookmark) { topic.bookmarks.create!(title: title, url: url, user: user) }

  it { is_expected.to belong_to(:topic)}
  it { is_expected.to belong_to(:user) }
end
