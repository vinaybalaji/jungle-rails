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

  describe '.authenticate_with_credentials' do
    it "should authenticate if email and password match" do
      user = User.authenticate_with_credentials('vinaybalaji@gmail.com', 'vinay')
      expect(user).to_not(be_nil)
    end
    it "should fail to authenticate if email and password don't match" do
      user = User.authenticate_with_credentials('vinaybalaji@gmail.com', 'balaji')
      expect(user).to(be_nil)
    end
    it "should authenticate if email case does not match user record" do
      user = User.authenticate_with_credentials('vinayBALAJI@gmail.com', 'vinay')
      expect(user).to_not(be_nil)
    end
    it "should authenticate if email has leading spaces" do
      user = User.authenticate_with_credentials('  vinaybalaji@gmail.com', 'vinay')
      expect(user).to_not(be_nil)
    end
    it "should authenticate if email has trailing spaces" do
      user = User.authenticate_with_credentials('vinaybalaji@gmail.com    ', 'vinay')
      expect(user).to_not(be_nil)
    end
  end

end
