require 'rails_helper'

describe Concert do
  context 'when create a concert' do
    subject(:concert) { build_stubbed(:concert) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:city) }
  end
end
