require 'rails_helper'

describe User, type: :model do

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.not_to allow_value('abc').for(:name) }
  it { is_expected.to allow_value('Abc').for(:name) }
  it { is_expected.not_to allow_value('john doe').for(:name)}
  it { is_expected.to allow_value('John Doe').for(:name) }

  describe '#user_initials' do
    let(:user) { User.new(params) }

    context 'given name is John Doe' do
      let(:params) { {name: 'John Doe'} }

      it 'returns user initials' do
        expect(user.user_initials).to eq('JD')
      end
    end

    context 'given name is Meg Ryan' do
      let(:params) { {name: 'Meg Ryan'} }

      it 'returns user initials' do
        expect(user.user_initials).to eq('MR')
      end
    end
  end



end



