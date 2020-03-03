require 'rails_helper'

describe Comment do
  context 'when create a comment' do
    subject(:comment) { build_stubbed(:comment) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:concert) }
  end
end
