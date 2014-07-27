require 'rails_helper'

describe Question, type: :model do
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to ensure_length_of(:body).is_at_least(3) }

  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.not_to allow_value('abc').for(:author) }
  it { is_expected.to allow_value('Abc').for(:author) }

  describe '#author_initials' do
    let(:question) { Question.new(params) }

    context 'given author is John Doe' do
      let(:params) { {author: 'John Doe'} }

      it 'returns author name initals' do
        expect(question.author_initials).to eq('JD')
      end
    end

    context 'given author is Meg Ryan' do
      let(:params) { {author: 'Meg Ryan'} }

      it 'returns author name initals' do
        expect(question.author_initials).to eq('MR')
      end
    end
  end

end
