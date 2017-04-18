require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save with all valid fields' do 
      user = User.new(
        first_name: 'Vinay',
        last_name: 'Balaji',
        email: 'vinaylighthouselabs@gmail.com', 
        password: 'vinay',
        password_confirmation: 'vinay'
      )
      expect(user).to(be_valid)
    end
    it 'should not save without a password field' do
      user = User.new(
        first_name: 'Vinay',
        last_name: 'Balaji',
        email: 'vinaylighthouselab@gmail.com',
        password: nil
      )
      expect(user).to_not(be_valid)
    end
    it 'should not save without a first_name field' do
      user = User.new(
        first_name: nil,
        last_name: 'Balaji',
        email: 'vinaylighthouselab@gmail.com',
        password: 'vinay',
        password_confirmation: 'vinay'
      )
      expect(user).to_not(be_valid)
    end
    it 'should not save without a last_name field' do
      user = User.new(
        first_name: 'Vinay',
        last_name: nil,
        email: 'vinaylighthouselab@gmail.com',
        password: 'vinay',
        password_confirmation: 'vinay'
      )
      expect(user).to_not(be_valid)
    end
    it 'should not save without an email field' do
      user = User.new(
        first_name: 'Vinay',
        last_name: 'Balaji',
        email: nil,
        password: 'vinay',
        password_confirmation: 'vinay'
      )
      expect(user).to_not(be_valid)
    end
    it 'should not save without a password confirmation field' do
      user = User.new(
        first_name: 'Vinay',
        last_name: 'Balaji',
        email: 'vinaylighthouselab@gmail.com',
        password: 'vinay',
        password_confirmation: nil
      )
      expect(user).to_not(be_valid)
    end
    it 'should not save if password does not equal password_confirmation' do
      user = User.new(
        first_name: 'Vinay',
        last_name: 'Balaji',
        email: 'vinaylighthouselab@gmail.com',
        password: 'vinay',
        password_confirmation: 'v'
      )
      expect(user).to_not(be_valid)
    end
    it 'should not save if email already exists in the database' do
      user = User.new(
        first_name: 'Vinay',
        last_name: 'Balaji',
        email: 'vinaybalaji@gmail.com',
        password: 'vinay',
        password_confirmation: 'vinay'
      )
      expect(user).to_not(be_valid)
    end
    it 'should not save if the password is less than 5 characters long' do
      user = User.new(
        first_name: 'Vinay',
        last_name: 'Balaji',
        email: 'vinaybalaji@gmail.com',
        password: 'v',
        password_confirmation: 'v'
      )
      expect(user).to_not(be_valid)
    end
  end
end
