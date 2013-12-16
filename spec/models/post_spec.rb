require 'spec_helper'

describe Post do
  let!(:post) { described_class.create! }

  describe '#post_type' do
    before { post.update_column(:post_type, value) }
    let(:expected_default_value) { described_class::PostTypeValues::NORMAL }

    subject { post.reload.post_type }

    context 'when value is set to a valid value' do
      let(:value) { described_class::PostTypeValues::SPECIAL }

      it {should eq value}
    end
    context 'when value is set to an invalid value' do
      context 'which is nil' do
        let(:value) { nil }

        it {should eq expected_default_value}
      end
      context 'which is empty string' do
        let(:value) { '   ' }

        it {should eq expected_default_value}
      end
    end
  end

  describe '#category_name' do
    before { post.update_column(:category_name, value) }
    let(:expected_default_value) { nil }

    subject { post.reload.category_name }

    context 'when value is set to a valid value' do
      let(:value) { described_class::CategoryNameValues::DRINK }

      it {should eq value}
    end
    context 'when value is set to an invalid value' do
      context 'which is nil' do
        let(:value) { nil }

        it {should eq expected_default_value}
      end
      context 'which is empty string' do
        let(:value) { '   ' }

        it {should eq expected_default_value}
      end
    end
  end
end
