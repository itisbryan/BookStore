require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  context 'when username is valid' do
    specify 'presence of username' do
      expect(@user.username.nil?).to be false
    end

    specify 'uniqueness of username' do
      another_user = create(:user)
      expect(another_user.username.nil?).to be false
      expect(another_user.username).not_to equal(@user.username)
    end
  end
end