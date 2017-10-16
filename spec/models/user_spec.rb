require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user = User.new
  end

  it 'should be invalid without a first_name' do
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:first_name]).to include('can\'t be blank')
  end
  
  it 'should be invalid without a last_name' do
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:last_name]).to include('can\'t be blank')
  end
  
  it 'should be invalid without an email' do
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:email]).to include('can\'t be blank')
  end


  describe '.authenticate' do
  end



    
end
