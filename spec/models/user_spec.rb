require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user = User.new
  end

  it 'saves with all fields filled in' do
    full_user = User.new(first_name: 'a', last_name: 'b', email: 'email@email.com', password: 'apple', password_confirmation: 'apple')
    full_user.save
    expect(full_user).to be_valid
  end

  it 'is invalid without a first_name' do
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:first_name]).to include('can\'t be blank')
  end
  
  it 'is invalid without a last_name' do
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:last_name]).to include('can\'t be blank')
  end

  it 'is invalid without password' do
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:password]).to include('can\'t be blank')
  end

  it 'is invalid if password and password confirmation do not match' do
    full_user = User.new(first_name: 'a', last_name: 'b', email: 'email@email.com', password: 'apple', password_confirmation: 'apple')
    full_user2 = User.new(first_name: 'b', last_name: 'a', email: 'email@email.com', password: 'apple', password_confirmation: 'APPLE')
    full_user.save
    full_user2.save
    expect(full_user.password).to eq(full_user.password_confirmation)
    expect(full_user2.password).to_not eq(full_user2.password_confirmation)
  end

  it 'is invalid without an email' do
    expect(@user).to_not be_valid
    expect(@user.errors.messages[:email]).to include('can\'t be blank')
  end

  it 'requires a unique email' do
    full_user1 = User.new(first_name: 'a', last_name: 'b', email: 'email@email.com', password: 'apple', password_confirmation: 'apple')
    full_user2 = User.new(first_name: 'a', last_name: 'b', email: 'email@email.com', password: 'APPLE', password_confirmation: 'APPLE')
    full_user1.save
    full_user2.save
    expect(full_user1).to be_valid
    expect(full_user2).to_not be_valid
    expect(full_user2.errors.messages[:email]).to include('has already been taken')
  end


    
end
