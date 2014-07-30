require 'rails_helper'

describe Answer, type: :model do
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to ensure_length_of(:body).is_at_least(3) }

end
