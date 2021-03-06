require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :target }
    it { is_expected.to validate_presence_of :body }
    it { is_expected.to validate_presence_of :send_at }
    it { is_expected.to validate_presence_of :program }
    it { is_expected.to validate_presence_of :delayed_template }
  end

  describe 'methods' do
    let(:message) { FactoryGirl.create :message }

    context '.kind' do
      it { expect(message.kind).to eq 'sms' }
    end
  end
end
